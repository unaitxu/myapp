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

export RAILS_ENV=test
source $HOME/.bashrc

cd .

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