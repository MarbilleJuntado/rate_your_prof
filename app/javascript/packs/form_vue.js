import Vue from 'vue/dist/vue.esm'

document.addEventListener('DOMContentLoaded', () => {
  var app = new Vue({
    el: '#formsample',
    data: {

    },
    methods: {
      submit() {
        alert('Haha');
      }
    }
  });
});