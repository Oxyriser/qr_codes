import Vue from "vue"
import Router from "vue-router"
import Front from "./views/Front.vue"
Vue.use(Router);

export default new Router({
  routes: [
    {
      path: "/",
      name: "front",
      component: Front
    },
    {
      path: "/home",
      name: "home",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "home" */ "./views/Home.vue")
    },
    {
      path: "/edit/:id",
      name: "edit",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "home" */ "./views/Edit.vue")
    },
    {
      path: "/front",
      name: "front",
      // route level code-splitting
      // this generates a separate chunk (about.[hash].js) for this route
      // which is lazy-loaded when the route is visited.
      component: () =>
        import(/* webpackChunkName: "front" */ "./views/Front.vue")
    },
    {
      path: '/url/stats',
      component: () =>
      import(/* webpackChunkName: "front" */ "./views/ChartAvancee.vue")
    },
    {
      path: '/url/:IDQR/stats',
      name: "ChartSepare",
      component: () =>
      import(/* webpackChunkName: "front" */ "./views/ChartAvanceeSepare.vue")
    }
  ]
});
