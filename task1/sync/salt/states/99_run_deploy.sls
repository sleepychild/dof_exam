deploy:
  cmd.run:
    - name: "/sync/scripts/tfdeploy.sh app"
    - retry:
        attempts: 5
        until: True
        interval: 5
        splay: 5

check:
  cmd.run:
    - name: 'curl "http://localhost:8080"'
    - require:
      - cmd: deploy
    - retry:
        attempts: 5
        until: True
        interval: 5
        splay: 5