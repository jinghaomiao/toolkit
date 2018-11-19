#!/usr/bin/env python

import os
import sys

import gflags
import glog
import pprint
import pymongo

gflags.DEFINE_string('mongo_host', '127.0.0.1', 'MongoDB host ip.')
gflags.DEFINE_integer('mongo_port', 27017, 'MongoDB port.')
gflags.DEFINE_string('output_dir', './.databases',
                     'Path to output dir. The result will be '
                     '<output_dir>/<db>/<collection>/<index>.doc')

# Global configs
AUTH = {
    'admin': ('<ADMIN_USER>', '<ADMIN_PASS>'),
    # <DB>: (<DB_USER>, <DB_PASS>),
}
IGNORED_DATABASES = set(['admin', 'local'])
IGNROED_COLLECTIONS = set(['system.indexes', 'system.users'])


class Worker(object):
    @staticmethod
    def Process():
        G = gflags.FLAGS
        url = 'mongodb://{}:{}@{}:{}'.format(
            AUTH['admin'][0], AUTH['admin'][1], G.mongo_host, G.mongo_port)
        client = pymongo.MongoClient(url)
        databases = client.database_names()
        glog.info('Found dababases: {}'.format(databases))
        for db_name in databases:
            if db_name in IGNORED_DATABASES:
                continue
            Worker.ProcessDB(client[db_name])

    @staticmethod
    def ProcessDB(db):
        if db.name in DB_AUTH:
            auth = DB_AUTH[db.name]
            db.authenticate(auth[0], auth[1])

        collections = db.collection_names()
        glog.info('Processing {} with collections {}'.format(db.name, collections))
        for col_name in collections:
            if col_name in IGNROED_COLLECTIONS:
                continue
            output_dir = os.path.join(gflags.FLAGS.output_dir, db.name, col_name)
            if not os.path.exists(output_dir):
                os.makedirs(output_dir)

            for index, doc in enumerate(db[col_name].find({})):
                with open(os.path.join(output_dir, '{}.doc'.format(index)), 'w') as fout:
                    pprint.pprint(doc, fout)

if __name__ == '__main__':
    gflags.FLAGS(sys.argv)
    Worker.Process()
