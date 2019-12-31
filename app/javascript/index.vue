<template>
  <div id="app">
    <div class="wrapper">
    <Header></Header>
    <div class="index_wrapper">
        <div class="title">
          <h2>やってみたいことを<br>言葉にしよう</h2>
          <p>目標を叶えるフォーマットで具体化してみよう</p>
        </div>
        
        <!-- start -->

        <div v-if="goals.length" class="note">
            <div class="head">
              <div class="title">
                <h3>📝目標の一覧</h3>
              </div>
              <div class="button make_goal">
                <router-link class="wrapper" :to="{path:'/setgoal/new'}">
                    <img v-bind:src="require('./packs/images/add.svg')" alt="arrow">
                    <p>作成する</p>
                </router-link>
              </div>
            </div>
            <ul v-for="g in goals" :key="g.id" class="goals">
              <li class="item">
                
                  <div class="wrap">
                    <router-link class="content" :to="{ name: 'SetgoalEdit', params: { id: g.id } }">
                      <h3 class="title">{{g.title}}</h3>
                    </router-link>
                    <div class="right_wrapper">
                      <button class="btn_delete" @click="deleteTarget = g.id; showModal = true">削除</button>
                      <img v-bind:src="require('./packs/images/arrow_right.svg')" alt="arrow">
                    </div>
                  </div>
                
              
              </li>
            </ul>
            
            
          </div>

           <div v-else class="note">
             <div class="ifempty">
               <div class="image">
                 <img v-bind:src="require('./packs/images/377-original.png')" >
               </div>
               <div class="message">さっそく目標を言葉にしてみよう</div>
               <div class="button make_goal">
                  <router-link class="wrapper" :to="{path:'/setgoal/new'}">
                      <img v-bind:src="require('./packs/images/add.svg')" alt="arrow">
                      <p>目標をつくる</p>
                  </router-link>
                </div>
             </div>
             
             </div>
        <!-- end -->
       
    </div>
    <div>
    </div>
    <Footer></Footer>
    </div>
    <modal class="modal_delete" v-if="showModal" @cancel="showModal = false" @ok="deleteGoal(); showModal = false;">
            <div class="wrap" slot="body"> 
              <p> 削除してもよろしいですか？</p>
            </div>
    </modal>
  </div>
</template>


<script>
import axios from 'axios';

import Modal from "./packs/components/modal.vue";
import Header from "./packs/components/header.vue";
import Footer from "./packs/components/footer.vue";

export default {
  components: {
    Header,
    Footer,
    Modal
  },
  data: function() {
    return {
      effort:[],
      goals: [],
      showModal: false,
      deleteTarget: -1,
      errors: ''
    };
  },
   mounted(){
     axios
      .post('/api/v1/efforts', this.effort)
      .then(response => {
        this.$router.push({ name: 'Index'})
      });
    axios
      .get('/api/v1/efforts.json')
      .then(response => (this.effort = response.data));

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
};
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/global.scss";
@import "./app/javascript/style/_mixin.scss";
@import "./app/javascript/style/setgoal.scss";

#app{
  .wrapper{
    background-color:#F5F4F1 ;
  }

}

.index_wrapper{
  width: 1180px;
  width: 82%;
  margin: 0 auto;
  padding: 0px 0 160px;
}
.title {
  @include fst-m;
  text-align: center;
  margin-bottom:56px;
  h2{
    letter-spacing: 2px;
    line-height: 2.8rem;
    font-size: 36px;
    margin-bottom: 24px;
    @include sp[
      font-size:24px;
    ]
    br{
      display: none;
    }
  }
  p{
    font-size: 14px;
    opacity: 0.72;
    font-weight: normal;
    line-height: 2;
    letter-spacing: 2px;
  }
}
.section_contents {
	.content_wrapper {
    display: flex;
    justify-content: space-between;
		.content{
      width: 30%;
      &:hover{
        .img{
          top: -8px;
          transition:$transiton-base ;
           transition: top 0.1s;
          position: relative;
          box-shadow: 2px 2px 32px rgba(0,0,0,0.20);
        }
      }
			 .img {
         height: 272px;
         overflow: hidden;
         border-radius: 16px;
         top:0px;
         margin-bottom: 24px;
         transition:$transiton-base ;
         box-shadow: 2px 2px 24px rgba(0,0,0,0.16);
         img{
           width: 100%;
           height: auto;
         }
			}
			 .text {
         margin: 0 12px;
         span{
           @include fsn-xs;
           font-weight: bold;
           margin-bottom: 8px;
           display: block;
          letter-spacing: 2px;
         }
         h3{
           @include fst-s;
           margin-bottom: 8px;
           letter-spacing: 1px;
         }
         p{
           @include fsn-s;
           font-weight: bold;
           opacity: 40%;;
         }
			}
	}
}
}

.content-enter {
  transform: translate(0px, -4px);
  opacity: 0;
}
.content-enter-to {
  opacity: 1;
}
.content-enter-active {
  transition: all 0.1s 0s ease;
}
.content-leave {
  transform: translate(0, 0);
  opacity: 1;
}
.content-leave-to {
  transform: translate(0px, -4px);
  opacity: 0;
}
.content-leave-active {
  transition: all .5s 0s ease;
}

@include sp{
  .index_wrapper{
    width:88%;
    .title{
      h2{
          line-height: 1.6;
        br{
          display:block;
        }
      }
    }
  }
  .section_contents {
      .content_wrapper {
            display: block;
        .content{
              width: 100%;
              margin-bottom: 64px;
        }
      }
  }
}




</style>
