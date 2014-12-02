class gutterball::database{
  include postgresql::server

  postgresql::server::db { 'gutterball':
    user     => $gutterball::dbuser,
    password => $gutterball::dbpassword,
  } ->
  postgresql::server::pg_hba_rule { 'allow authenticated users over ipv4 loopback':
    type        => 'host',
    database    => 'all',
    user        => 'all',
    address     => '127.0.0.1/32',
    auth_method => 'password',
  } #->
  #TODO
  #Package['gutterball'] ->
  #exec { 'migrate database':
  #  path => ['/usr/bin', '/bin'],
  #  command => "liquibase --driver=org.postgresql.Driver \
  #      --classpath=/usr/share/java/postgresql-jdbc.jar:/var/lib/tomcat6/webapps/gutterball/WEB-INF/classes/ \
  #      --changeLogFile=db/changelog/changelog.xml \
  #      --url=jdbc:postgresql:gutterball \
  #      --username=${gutterball::dbuser}\
  #      --password=${gutterball::dbpassword}\
  #      update"
  #}

}
