
/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('loaditem', require('./components/Loaditem.vue').default);

Vue.component('overload', require('./components/Overload.vue').default);
Vue.component('newcomp', require('./components/Newcomp.vue').default);

import BackToTop from 'vue-backtotop'
Vue.use(BackToTop)
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

 import lazyload  from './directives/lazyload';
 import StickySidebar from 'sticky-sidebar';

const app = new Vue({
    el: '#app',
    components: { BackToTop },
    directives: {
        lazyload
      },
    created(){
    //   var sidebar = new StickySidebar('#sidebar', {
    //     containerSelector: '#main-content',
    //     innerWrapperSelector: '.sidebar__inner',
    //     topSpacing: 20,
    //     bottomSpacing: 20
    // });
    }
});
