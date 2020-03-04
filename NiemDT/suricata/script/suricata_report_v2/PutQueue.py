import Mysql
import redis

#r = redis.StrictRedis(host='10.10.34.129')

def put(r, sql, myConnection , q):
    values = sql.query(myConnection, "IP")
    for key in r.scan_iter():
        k = key.decode("utf-8")
        if k not in values:
            #print(k)
            q.put(k)
