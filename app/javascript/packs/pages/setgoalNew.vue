<template>
  <div class="goal_detail">
    <!-- <HeaderGoal></HeaderGoal> -->
     <header class="header">
        <nav class="nav">
          <ul class="wrapper">
            <li class="back">
              <router-link to="/setgoal">
                  <span class="icon">
                    <img v-bind:src="require('../images/arrow_back.svg')" alt="arrowback">
                  </span>
                  <p>戻る</p> 
              </router-link>
            </li>
            <li @click="createGoal" class="save">作成する</li>
          </ul>
        </nav>
      </header>

    <div v-if="errors.length != 0">
      <ul v-for="e in errors" :key="e">
        <li><font color="red">{{ e }}</font></li>
      </ul>
    </div>

    <form @submit.prevent="createGoal">
    <div class="note">
      <div class="wrapper">
          <div class="title">
            <input v-model="goal.title" type="text" placeholder="目標 - 例）毎月１冊本を読む">
          </div>
          <div class="goalcontent">
            <ul class="wrapper"  >
              <li class="detail">
                <h4>🚀目標のためにやること</h4>
                <textarea class="content" v-model="goal.action" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                value="目標達成にやるべきことを具体化してみましょう

■ 環境を変化させて実行できる方法も考えてみましょう
■ 達成するための条件を挙げてみましょ王
■ 細かいイメージまで持つことで達成確率が上がりますよ、多分。" 
                placeholder="目標達成にやるべきことを具体化してみましょう
■ 環境を変化させて実行できる方法も考えてみましょう
■ 達成するための条件を挙げてみましょ王
■ 細かいイメージまで持つことで達成確率が上がりますよ、多分。"
                >
                </textarea>
              </li>
              <li class="detail">
                <h4>⛰達成の障害になること</h4>
                <textarea class="content" v-model="goal.problem" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                placeholder="達成が困難な要素をを書き出しましょう

■ 先回りして壁になることを予測してみましょう
■ 壁を先にイメージすることで達成確率が上がるか
■ 解決策はすぐに思いつかないかもしれません。まずは意識するだけで大丈夫です">
                </textarea>
              </li>
            </ul>
          </div>
        </div>
    </div>
    </form>
    
  </div>
  
</template>

<script>
import axios from 'axios';

import HeaderGoal from "../components/header-goal.vue";

export default {
  components: {
    HeaderGoal
  },
  data: function (){
   return {
     goal: {
       title:'',
       action:'',
       problem:''
     },
     errors:''
   }
 },
  methods:{
    createGoal: function(){
      axios
      .post('/api/v1/goals', this.goal)
      .then(response => {
        let g = response.data;
        this.$router.push({name: 'SetgoalEdit', params:{id: g.id}})
      })
      .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    }
  },
}
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/global.scss";
@import "./app/javascript/style/_mixin.scss";
.goal_detail {
  background-color:#FAF5EC;
  padding-bottom: 80px;
	.note {
    background-color: white;
    border-radius:8px;
    padding: 48px;
    width: 88%;
    margin: 0 auto;
		.wrapper {
			.title {
        padding: 32px auto;
        margin-bottom: 32px;
        width: 100%;
        border-bottom: 1px solid #dadbdd;
        input[type="text"]{
          font-size: 32px;
          font-weight: bold;
          text-align: center;
          padding-bottom: 40px;
        }
        h3{
          @include fst-l;
          text-align: center;
          margin-bottom: 32px;
        }
			}
		}
	}
}
.goalcontent {
				.wrapper {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-between;
					.detail {
            width: calc(50% - 16px);
            height: 400px;
            padding: 24px;
            border-bottom: none;
            &:nth-child(odd){
              border-right: 1px solid #f3f3f4;
            }
            &:nth-child(1),&:nth-child(2){

              border-bottom: 1px solid #f3f3f4;
            }
            
            h4{
              @include fst-m;
              margin-bottom: 24px;
              font-size: 16px;
            }
            textarea{
              @include fsn-m;
              padding: 0;
              line-height: 1.8;
            }
					}
				}
}
.goal_detail{
  .content::-webkit-input-placeholder {
    color: #999;
    }
     input:focus{
      outline: 0;
      border:none;
      box-shadow: none;
    }
    textarea:focus{
      outline: 0;
      border:none;
      box-shadow: none;
    }
}


.header {
  background: none;
  padding: 20px 32px;
  position: relative;
	.nav {
		.wrapper {
      display: flex;
      justify-content: space-between;
      width: 100%;
			 .back{
        padding: 12px 16px;
        a{
          display: flex;
          justify-content: space-between;
          text-decoration: none;
          background-color: rgba(0,0,0,0.04);
          border-radius: 100px;
          padding: 12px 20px 10px 16px;
          .icon {
              margin-right: 12px
          }
          p{
            padding: 4px 0;
          }
        }
				
        p{
          font-size:14px;
          font-weight: bold;
          line-height:1;
        }
			}
			.save {
        padding: 24px 24px;
    font-size: 14px;
    border-radius: 100px;
    height: 0;
    line-height: 0;
    color: white;
    background-color: #080725;
    box-shadow: 1px 1px 4px rgba(0,0,0,0.08);
    transition: all 0.4s;
    cursor: pointer;
    &:hover{
      background-color: white;
      color: #080725;
      font-weight: bold;
      box-shadow: 1px 1px 8px rgba(0,0,0,0.16);
    }
			}
		}
	}
}
@include sp{
  .goal_detail{
    .header{
        padding: 20px 4px;
        margin-bottom: 48px;
    }    
    .note{
      width: 96%;
      padding: 20px;
      .title{
        input[type="text"]{
          font-size: 24px;
        }
      }
      .goalcontent{
        .wrapper{
          display: block;
          .detail{
            width: 100%;
          }
        }
      }
    }
  }
}

</style>
