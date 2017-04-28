pipeline {
  agent any
  stages {
    stage('Echo') {
      steps {
        parallel(
          "Echo": {
            sh 'echo \'olii\''
            
          },
          "Echo 2": {
            sh 'echo \'oli again\''
            
          }
        )
      }
    }
    stage('Test') {
      steps {
        sh '''#!/bin/bash

sudo su - centos

sudo su - centos export PATH=$PATH:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims
sudo su - centos export MYAPP_DATABASE_PASSWORD=myapp

sudo su - centos whoami

which rbenv
which ruby

sudo su - centos eval "$(rbenv init -)"

sudo su - centos rbenv local 2.4.1
sudo su - centos rbenv rehash

sudo su - centos bundle install
sudo su - centos bundle exec rails db:create db:schema:load db:migrate
sudo su - centos bundle exec rails test'''
      }
    }
    stage('Echo 3') {
      steps {
        sh 'echo \'Works!\''
      }
    }
    stage('Deploy') {
      steps {
        sh '''#!/bin/bash

bundle exec cap production deploy'''
      }
    }
    stage('Echo 4') {
      steps {
        sh 'echo \'Done!\''
      }
    }
  }
}