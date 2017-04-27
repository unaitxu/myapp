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

export PATH=$PATH:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims
export MYAPP_DATABASE_PASSWORD=myapp

whoami

which rbenv
which ruby

eval "$(rbenv init -)"

rbenv local 2.4.1
rbenv rehash

bundle install
bundle exec rails db:create db:schema:load db:migrate
bundle exec rails test'''
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