class octo_py {
  exec { "download_octo_py":
    cwd => "/root",
    command => "/usr/bin/wget http://octopy.googlecode.com/files/octopy-0.1.zip",
    creates => "/root/octopy-0.1.zip",
  }
  exec { "install_octo_py":
    cwd => "/usr/local/bin",
    command => "unzip /root/octopy-0.1.zip",
    creates => "/usr/local/bin/octo.py",
    require => [ Exec["download_octo_py"] ]
  }

  file { "/usr/local/bin/octo.py":
    mode => 755,
    require => [ Exec["install_octo_py" ] ]
  }

}
