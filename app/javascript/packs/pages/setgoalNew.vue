<template>
  <div class="goal_detail">
     <header class="header">
        <nav class="nav">
          <ul class="wrapper">
            <li class="back">
              <router-link to="/">
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
            <input v-model="goal.title" type="text" placeholder="目標を設定しよう">
          </div>

          <div class="action_wrap">
            <li class="detail">
                <h4 class="subtitle">🚀目標のためにやること/段取りを書き出そう</h4>
                <textarea class="content" v-model="goal.action" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                value="" 
                placeholder="実現に向けてやることを具体化してみよう

■ 🤔目標達成のための要素を分解して言葉にしてみましょう
■ 🌈自分を後押しする環境を作ることも考えるとよいかも
■ 😶達成を助けてくれる人や会うべき人がいれば加速してくれるかも"
                >
                </textarea>
              </li>
              <li class="detail">
                <h4 class="subtitle">⛰達成の障害になることを書き出そう</h4>
                <textarea class="content" v-model="goal.problem" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                value="" 
                placeholder="敵を知り、己を知れば、百戦危うからず

■ 👀 難しいことは早めにやって失敗しておくと良いやり方が見つかるかも
■ 😛 困難にぶつかった時の対処を今のうちから考えると良いかもしれません"
                >
                </textarea>
              </li>
          </div>

          <!-- <div class="goalcontent">
            <ul class="wrapper" >
              <li class="detail people">
                <h4>❓達成したい理由</h4>
                <textarea class="content" v-model="goal.reason" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                placeholder="自分だけでも共感できる理由があれば、それが後押ししてくれるはずです">
                </textarea>
              </li>
              <li class="detail environment">
                <h4>🌈自分を後押しする環境</h4>
                <textarea class="content" v-model="goal.environment" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                placeholder="環境の力は偉大です
■ まわりが変わると自分が変わるという話、よく聞きますよね・・・・">
                </textarea>
              </li>
              <li class="detail people">
                <h4>😶達成を助けてくれる人</h4>
                <textarea class="content" v-model="goal.people" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                placeholder="誰かの力が必要なこともあるかもしれません。
■ 励ましてくれる人、教えてくれる人・・・どんな人がいるかな〜">
                </textarea>
              </li>
              <li class="detail">
                <h4>⛰達成の障害になること</h4>
                <textarea class="content" v-model="goal.problem" v-on:keypress.enter="createGoal" name="" id="" cols="30" rows="10" 
                placeholder="敵を知り、己を知れば、百戦危うからず〜〜（ドドんっ

■ 困難にぶつかった時、どうするかも考えると良いかもしれません
■ 難しいことは早めにやって失敗しておくと良いやり方が見つかるかも">
                </textarea>
              </li>
            </ul>
          </div> -->
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
       problem:'',
       people:'',
       reason:'',
       environment:'',
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
    @include note;
    background-color: white;
    padding: 48px;
    width: 94%;
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
      .action_wrap{
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #f3f3f4;
        margin: 80px 0 56px;
        @include sp{
          display: block;
        }
        .detail{
          width: calc(50% - 16px);
          list-style: none;
        font-size: 20px;
        @include sp{
          width: 100%;
        }
          .subtitle{
            margin: 0 0 32px;
            font-weight: bold;
          }
          .content{
             height: 425px;
            font-size: 16px;
            margin-top: 0px;
            margin-bottom: 0px;
          }
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
            height: 280px;
            padding: 24px;
            border-bottom: none;
            margin-bottom: 80px;
            &:nth-child(odd){
              border-right: 1px solid #f3f3f4;
            }
            &:nth-child(1),&:nth-child(2){
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
           &:hover{
            background-color: rgba(0,0,0,0.12);
          }
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
  .action_wrap{
        display: block;
        .detail{
          width: 100%
        }
  }
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
            &:nth-child(odd){
              border-right: none;
            }
          }
        }
      }
    }
  }
}

</style>
