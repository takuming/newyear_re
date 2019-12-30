<template>
  <div class="setgoal">
    <HeaderIndex></HeaderIndex>
    <div class="title">
      <p>PHAESE 3</p>
      <h3>新年の目標をつくろう🚩</h3>
      <p class="list">・興味、好奇心、変化。やってみたいことを言葉にしてみましょう<br>・目標実現のために必要な行動も書いてみましょう</p>
    </div>
    <div class="note">
      <ul v-for="g in goals" :key="g.id" class="goals">
        <li class="item">
          
            <div class="wrapper">
              <router-link class="content" :to="{ name: 'SetgoalEdit', params: { id: g.id } }">
                <h3 class="title">{{g.title}}</h3>
              </router-link>
              <div class="right_wrapper">
                 <button class="btn_delete" @click="deleteTarget = g.id; showModal = true">削除</button>
                 <img v-bind:src="require('../images/arrow_right.svg')" alt="arrow">
              </div>
            </div>
          
         
        </li>
      </ul>
      <div class="button make_goal">
        <router-link class="wrapper" :to="{path:'/setgoal/new'}">
            <img v-bind:src="require('../images/add.svg')" alt="arrow">
            <p>目標を追加する</p>
        </router-link>
      </div>
    </div>
     <modal class="modal_delete" v-if="showModal" @cancel="showModal = false" @ok="deleteGoal(); showModal = false;">
      <div class="wrapper" slot="body"> 
        <p> 削除してもよろしいですか？</p>
      </div>
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
  padding-bottom: 320px;
  
  .content{
    padding: 24px 24px;
    display: block;
  }
  .btn_delete{
      background-color: #f3f3f4;
    font-size: 12px;
    background: #f3f3f4;
    background-image: none;
    border: none;
    box-shadow: none;
    text-shadow: none;
    color: #999;
    cursor: pointer;
     &:hover{
        background-color: #f9fafc; 
      }
    }
    img{
          margin: 0px 0 -7px;
    }
	.title {
        margin: 24px 0 56px;
    h3{
      @include fst-l;
      text-align: center;
      margin-bottom: 8px;
      color: #080725;
    }
    p{
      @include fsn-s;
      @include eng_font;
      text-align: center;
      color: #080725;
      margin-bottom: 12px;
    font-weight: bold;
    }
    p.list{
      @include plist;
      border-top: 1px solid rgba(0, 0, 0, 0.16);
      border-bottom: 1px solid rgba(0, 0, 0, 0.16);
    }
	}
	.note {
    @include note;
    padding: 72px;
    width: 95%;
    min-height: 400px;
		.goals {
      &:hover{
     background-color: #f9fafc; 
    }
			.item {
        border-bottom: 1px solid #f3f3f4;
        padding: 24px;
        border-radius: 16px;
        margin-bottom: 24px;
        .wrapper{
              display: flex;
              justify-content: space-between;
              .content{
                padding: 24px 0;
                  width: 80%;
                .title {
                  @include fst-s;
                  margin: 0;
                }
              }
              .right_wrapper{
                    padding: 24px 0;
              }
              
        }
				
			}
		}
  }
  .modal_delete{
    .modal-container{
          width: 320px;
          padding: 32px 32px 64px;
          border-radius: 16px;
      .modal-default-button{
        background-color: #f3f3f4;
        font-size: 16px;
        background: #f3f3f4;
        background-image: none;
        border: none;
        box-shadow: none;
        text-shadow: none;
        color: #000;
        cursor: pointer;
        padding: 12px 28px;
        &.ok{}
        &.delete{
          background: none;
          color: #999
        }
      }
    }
  }
  .make_goal{
    margin: 64px 0 0;
    .wrapper{
      display: flex;
      justify-content: space-between;
      img{
            margin: -5px 0 0;
      }
    }
    a{
    padding: 20px 24px 16px;
    background-color: #f3f3f4;
    display: block;
    border-radius: 100px;
    width: 15.5%;
    font-size: 14px;
    text-align: center;
    font-weight: bold;
    margin-left: 24px;
    &:hover{
      background-color: #dadbdd;
    }
    }
  }
}

@include sp{
  .note{
    min-height: 296px!important;
  }
  .setgoal {
    .make_goal{
      .wrapper{
        width: 60%;
        padding: 28px 24px 24px;
      }
    }
  }
}

</style>
