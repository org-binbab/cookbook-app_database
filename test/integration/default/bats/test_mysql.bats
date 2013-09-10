
load common

################################################################################
## test mysql actions ##
################################################################################

basepath="$TMP_BASE/mysql_test"

@test ":configure" {
  [ -d "$basepath" ]
  cd "$basepath"
  [ -e "mysql.conf" ]
  mysqldump --defaults-extra-file=mysql.conf test
}

@test ":migrate" {
  [ -d "$basepath" ]
  cd "$basepath"
  [ ! -e "latest-migration.sql" ]
  [ -e "mysql-schema.version" ]
  [ "$(head -n1 mysql-schema.version)" == "1.0" ]
}

@test ":backup" {
  [ -d "$basepath" ]
  cd "$basepath"
  [ -e backup-mysql_test*.mysql.tgz ]
  tar -xzf backup-mysql_test*.mysql.tgz
  cat backup-mysql_test*.mysql | grep "MySQL dump"
  cat backup-mysql_test*.mysql | grep "app_database_test"
  cat backup-mysql_test*.mysql | grep "VALUES (1)"
}
