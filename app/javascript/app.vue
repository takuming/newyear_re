<template>
  <div>
    <transition mode="out-in">
      <router-view></router-view>
    </transition>
  </div>
</template>

<script>
import axios from 'axios';

import Vue from "vue";
import VueRouter from "vue-router";

import Index from "index.vue";
import Lookback from "./packs/pages/lookback.vue";
import Effort from "./packs/pages/effort.vue";
import LookbackMonth from "./packs/pages/month.vue";
import LookbackReflection from "./packs/pages/reflection.vue";
import LookbackCuriosity from "./packs/pages/curiosity.vue";
import Setgoal from "./packs/pages/setgoal.vue";
import SetgoalNew from "./packs/pages/setgoalNew.vue";
import SetgoalEdit from "./packs/pages/setgoalEdit.vue";

import Opening from "./packs/components/opening.vue";
import OpMonth from "./packs/components/op/month-op.vue";
import OpReflection from "./packs/components/op/reflection-op.vue";
import OpCuriosity from "./packs/components/op/curiosity-op.vue";
import OpEffort from "./packs/components/op/effort-op.vue";
import OpGoal from "./packs/components/op/goal-op.vue";

import Intro from "./packs/components/intro.vue";
import IntroMonth from "./packs/components/op/month-intr.vue";
import IntroReflection from "./packs/components/op/reflection-intr.vue";
import IntroCuriosity from "./packs/components/op/curiosity-intr.vue";
import IntroEffort from "./packs/components/op/effort-intr.vue";
import IntroGoal from "./packs/components/op/goal-intr.vue";

const router = new VueRouter({
  routes: [
    { path: "/", component: Index },
    { path: "/lookback", component: Lookback },
    { path: "/efforts/:user_id/:id(\\d+)", name: 'Effort',component: Effort },

    { path: "/setgoal", name: 'Setgoal',component: Setgoal },
    { path: "/setgoal/new",name: 'SetgoalNew', component: SetgoalNew },
    { path: "/setgoal/:id(\\d+)",name: 'SetgoalEdit',component: SetgoalEdit },

    { path: "/lookback/month/:user_id/:id(\\d+)",name: 'LookbackMonth', component: LookbackMonth },
    { path: "/lookback/reflection/:user_id/:id(\\d+)",name:'Reflection', component: LookbackReflection },
    { path: "/lookback/curiosity/:user_id/:id(\\d+)",name:'Curiosity', component: LookbackCuriosity },

    { path: "/opening", name:'Opening',component: Opening },
    { path: "/opening/month", name:'OpMonth',component: OpMonth },
    { path: "/opening/reflection", name:'OpReflection',component: OpReflection },
    { path: "/opening/curiosity", name:'OpCuriosity',component: OpCuriosity },
    { path: "/opening/effort", name:'OpEffort',component: OpEffort },
    { path: "/opening/goal", name:'OpGoal',component: OpGoal },

    { path: "/intro", name:'Intro', component: Intro },
    { path: "/intro/month", name:'IntroMonth', component: IntroMonth },
    { path: "/intro/reflection", name:'IntroReflection', component: IntroReflection },
    { path: "/intro/curiosity", name:'IntroCuriosity', component: IntroCuriosity },
    { path: "/intro/effort", name:'IntroEffort', component: IntroEffort },
    { path: "/intro/goal", name:'IntroGoal', component: IntroGoal },
  ]
});

// ref. https://jp.vuejs.org/v2/guide/plugins.html#%E3%83%97%E3%83%A9%E3%82%B0%E3%82%A4%E3%83%B3%E3%81%AE%E4%BD%BF%E7%94%A8
Vue.use(VueRouter);

export default {
  router,
  data: function () {
    return {
      employees: []
    }
  }
};
</script>

<style>
@import "./style/global.scss";
@import "./style/_mixin.scss";

.v-enter {
  transform: translate(0px, -4px);
  opacity: 0;
}
.v-enter-to {
  opacity: 1;
}
.v-enter-active {
  transition: all 1s 0s ease;
}
.v-leave {
  transform: translate(0, 0);
  opacity: 1;
}
.v-leave-to {
  transform: translate(0px, -4px);
  opacity: 0;
}
.v-leave-active {
  transition: all .5s 0s ease;
}
</style>
