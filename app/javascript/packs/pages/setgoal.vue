<template>
  <div class="setgoal">
    <HeaderIndex></HeaderIndex>
    <div class="title">
      <p>PHAESE 3</p>
      <h3>目標を設定しよう</h3>
    </div>
    <div class="note">
      <ul v-for="g in goals" :key="g.id" class="goals">
        <li class="item">
          <router-link :to="{ name: 'SetgoalEdit', params: { id: g.id } }">
            <div class="wrapper">
              <h3 class="title">{{g.title}}</h3>
              <div>></div>
            </div>
          </router-link>
          <button @click="deleteTarget = g.id; showModal = true">削除</button>
        </li>
      </ul>
      <div class="button make_goal">
        <router-link :to="{path:'/setgoal/new'}">
            <p>目標を追加する</p>
        </router-link>
      </div>
    </div>
     <modal v-if="showModal" @cancel="showModal = false" @ok="deleteGoal(); showModal = false;">
      <div slot="body">削除してもよろしいですか？</div>
    </modal>
  </div>
</template>

<script>

import axios from 'axios';

import Modal from "../components/modal.vue";
import HeaderIndex from "../components/header-index.vue";

export default {
  components: {
    HeaderIndex,
    Modal
  },
  data: function () {
    return {
      goals: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    }
  },
  mounted(){
    this.updateGoals();
    axios
      .get('/api/v1/goals.json')
      .then(response => (this.goals = response.data))
  },
  methods: {
    deleteGoal: function() {
      if (this.deleteTarget <= 0) {
        console.warn('deleteTarget should be grater than zero.');
        return;
      }

      axios
        .delete(`/api/v1/goals/${this.deleteTarget}`)
        .then(response => {
          this.deleteTarget = -1;
          this.updateGoals();
        })
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
    updateGoals: function() {
      axios
        .get('/api/v1/goals.json')
        .then(response => (this.goals = response.data))
    }
  },
}
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/global.scss";
@import "./app/javascript/style/_mixin.scss";
.header{
  color: white;
  .save{
    color: #000;
  }
}
.setgoal {
  background-color:#FAF5EC;
  padding-bottom: 80px;
	.title {
    margin-bottom: 48px;
    h3{
      @include fst-l;
      text-align: center;
      margin-bottom: 8px;
      color: #fff;
    }
    p{
      @include fsn-s;
      text-align: center;
      color: #fff;
    }
	}
	.note {
    @include note;
    padding: 72px;
    width: 84%;
		.goals {
			.item {
        border-bottom: 1px solid #f3f3f4;
        padding: 24px;
        border-radius: 16px;
        margin-bottom: 24px;
        .wrapper{
              display: flex;
              justify-content: space-between;
              .title {
                  @include fst-s;
                  margin: 0;
              }
        }
				
			}
		}
	}
}

</style>
