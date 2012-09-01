node basenode {
  include base
  include python
  include octo_py
}

node 'server.example.com' inherits basenode {
}

node 'worker1.example.com' inherits basenode {
}

