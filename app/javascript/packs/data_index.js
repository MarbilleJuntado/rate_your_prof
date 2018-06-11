import Vue from 'vue/dist/vue.esm';
import axios from 'axios';

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#index',
    data: {
      courses: [],
      professors: []
    },
    created () {
      axios.get('/courses.json').then(response => {
        this.courses = response.data;
      }).catch(error => {
        console.log(error);
      });

      axios.get('/professors.json').then(response => {
        this.professors = response.data;
      }).catch(error => {
        console.log(error);
      });
    }
  });
});