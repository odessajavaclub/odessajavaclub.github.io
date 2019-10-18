#!/usr/bin/env groovy Jenkinsfile

import java.text.SimpleDateFormat

pipeline {

  agent any

  parameters {
    string(
        name: 'post_title',
        description: 'Used for filename and post title. The space will be replaced by `-` in the file name.',
        defaultValue: ''
    )
    text(
        name: 'post_body',
        description: 'Use GitHub MD format',
        defaultValue: 'This week on Odessa Java club'
    )
    booleanParam(
        name: 'post_footer',
        description: 'Add "Join us next Wednesday, at 12:00 in target room"',
        defaultValue: true
    )
    choice(
        name: 'room',
        description: 'Meeting room',
        choices: ['Jamaica (room 223)', 'Spain (room 426)'] // TODO: Replace this with Odessa rooms
    )
    string(
        name: 'details_url',
        description: 'Path to video or GitHub repo',
        defaultValue: ''
    )
    string(
        name: 'image_url',
        description: 'Path to the post image',
        defaultValue: '/assets/images/post.png',
    )
  }

  environment {
    GIT_TOKEN = credentials("jenkins-github-access-token")
  }

  stages {

    stage('Set up Git env') {
      steps {
        script {
          dir("${env.WORKSPACE}") {
            sh 'git fetch'
            sh 'git pull'
            sh "git config remote.origin.url 'https://${env.GIT_TOKEN}@github.com/odessajavaclub/odessajavaclub.github.io.git'"
            sh 'git clean -fdx'
          }
        }
      }
    }

    stage('Prepare post') {
      // when {
      //   branch 'jenkinsfile'
      // }
      steps {
        script {
          def date = new Date()
          def dateday = new SimpleDateFormat('yyyy-MM-dd').format(date)
          def datetime = new SimpleDateFormat('yyyy-MM-dd H:m').format(date)
          def title = "${params.post_title}".replaceAll('[ #]', '-')

          env.FILENAME = "${dateday}-${title}.md"

          env.MESSAGE = "${params.post_body.replaceAll("'ll", " will")}" +
              ({params.details_url} ? "${params.details_url}" : "") +
              "\\n" +
              ({params.post_footer} ? "Join us next Wednesday, at 12:00 in ${params.room}" : "")

          env.POST = "---\n" +
              "layout: post\n" +
              "title:  \"${params.post_title}\"\n" +
              "image: ${params.image_url}\n" +
              "date: ${datetime}:00 +0200\n" +
              "---\n" +
              "\n" +
              "${params.post_body}" +
              "\n" +
              ({params.details_url} ? "[${params.details_url}](${params.details_url})" : "") +
              "\n\n" +
              ({params.post_footer} ? "Join us next Wednesday, at 12:00 in ${params.room}" : "")

          sh 'printenv'
        }
      }
    }

    stage('Create post') {
      // when {
      //   branch 'jenkinsfile'
      // }
      steps {
        script {
          dir("${env.WORKSPACE}/_posts") {
            writeFile([file: "${env.FILENAME}", text: "${env.POST}"])
            sh 'git status'
            sh "git add ${env.FILENAME}"
            sh "git commit -m '${params.post_title}'"
            sshagent(['jenkins-github-ssh-key']) {
              sh 'git push origin HEAD:jenkinsfile'
            }
          }
        }
      }
    }
  }
}
