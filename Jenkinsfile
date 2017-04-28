pipeline {
  agent any
  stages {
    stage('Echo') {
      steps {
        parallel(
          "User": {
            sh 'whoami'
            
          },
          "Rbenv/Ruby": {
            sh '''source ~/.bash_profile
which rbenv
which ruby
'''
            
          }
        )
      }
    }
    stage('Test') {
      steps {
        sh '''#!/bin/bash

export PATH=$PATH:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims
export MYAPP_DATABASE_PASSWORD=myapp

eval "$(rbenv init -)"

rbenv local 2.4.1
rbenv rehash

bundle install
bundle exec rails db:create db:schema:load db:migrate
bundle exec rake'''
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

export PATH=$PATH:/usr/local/bin:$HOME/.rbenv/bin:$HOME/.rbenv/shims
export MYAPP_DATABASE_PASSWORD=myapp

eval "$(rbenv init -)"

rbenv local 2.4.1
rbenv rehash

cap production deploy
'''
      }
    }
    stage('Echo 4') {
      steps {
        sh 'echo \'Done!\''
      }
    }
  }
}