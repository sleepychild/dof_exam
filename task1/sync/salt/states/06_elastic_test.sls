check.elastic:
  cmd.run:
    - name: 'curl "http://localhost:9200"'
    - retry:
        attempts: 3
        until: True
        interval: 5
        splay: 5