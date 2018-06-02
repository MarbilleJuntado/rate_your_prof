import Vue from 'vue/dist/vue.esm';
import axios from 'axios';


document.addEventListener('DOMContentLoaded', () => {
  var index = new Vue({
    el: '#index',
    data: {
      courses: []
    },
    created () {
      axios.get('courses').then(response => {
        console.log(response.data);
        this.courses = response.data;
      });
    }
  });
});