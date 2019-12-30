<template>
  <div class="month">
    <header class="header">
    <nav class="nav">
      <ul class="wrapper">
        <li class="back">
          <router-link to="/lookback">
              <span class="icon">
                <img v-bind:src="require('../images/arrow_back.svg')" alt="arrowback">
              </span>
              <p>戻る</p> 
          </router-link>
        </li>
        <li @click="updateLbmonth" class="save">保存する</li>
      </ul>
    </nav>
  </header>
    <div class="title">
            <h3>月ごとに今年を振り返ろう🧐</h3>
            <p class="list">・今年を振り返るウォームアップをしましょう<br>・今年の出来事を月ごとに思いつくだけ書き出しましょう<br>・目安は20分です。事実とその時の気持ちをベースに書いてみましょう<br>・フォーム内でEnterを押して改行すると自動的に保存されます。</p>
          </div>
    <div class="note">
      <div class="wrapper">
          <div class="monthlist">
            <ul class="wrapper"  >
              <!-- <li  v-for="m in monthes" class="detail">
                <h4>{{m.number}}月</h4>
                <textarea name="" id="" cols="30" rows="10" 
                placeholder="この月にあったことを2つ~５つなんでも書き出そう
                ・仕事であったこと
                ・恋愛であったこと
                ・旅行先
                ・考えたこと
                ・感感情が動いたこと
                etc">
                </textarea>
              </li> -->
              <li class="detail">
                <h4>1<span class="mini">月</span></h4>
                <textarea
                  class="form"
                  v-model="lbmonth.jan"
                  placeholder="この月にあったことを2つ~５つなんでも書き出そう
・仕事であったこと
・恋愛であったこと
・旅行先
・考えたこと
・感感情が動いたこと
etc"
                  v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth"
                ></textarea>
              </li>
              <li class="detail">
                <h4>2<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.feb" name="" id="" cols="30" rows="10" 
                placeholder="この月にあったことを2つ~５つなんでも書き出そう
・仕事であったこと
・恋愛であったこと
・旅行先
・考えたこと
・感感情が動いたこと
etc" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>3<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.mar" name="" id="" cols="30" rows="10" 
                placeholder="瞳を閉じればあなたがまぶたの〜〜いるようで" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>4<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.apr" name="" id="" cols="30" rows="10" 
                placeholder="春、桜満開。新しい出会い。とかありました？" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>5<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.may" name="" id="" cols="30" rows="10" 
                placeholder="夏を感じる天気が増えはじめる付きですよね。" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>6<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.jun" name="" id="" cols="30" rows="10" 
                placeholder="何となく雨が降る月ですが、何がありましたか" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>7<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.jul" name="" id="" cols="30" rows="10" 
                placeholder="やばい！夏だ！海だ!花火だ！ラブロマンスだ！？" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>8<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.aug" name="" id="" cols="30" rows="10" 
                placeholder="気づいたら1年の半分が過ぎている8月です。" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>9<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.sep" name="" id="" cols="30" rows="10" 
                placeholder="秋と言いつつまだ夏ですよね" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>10<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.oct" name="" id="" cols="30" rows="10" 
                placeholder="ちょっと過ごしやすくなってくる季節" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>11<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.nov" name="" id="" cols="30" rows="10" 
                placeholder="え、もう今年が数ヶ月しかない・・・と思う月。どうでした？" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              <li class="detail">
                <h4>12<span class="mini">月</span></h4>
                <textarea v-model="lbmonth.dec" name="" id="" cols="30" rows="10" 
                placeholder="記憶の新しい月。振り返りお疲れさまです。" v-on:keyup.enter="updateLbmonth"
                  v-on:change="updateLbmonth">
                </textarea>
              </li>
              
            </ul>
          </div>
        </div>
    </div>
    
  </div>
  
</template>

<script>
import axios from 'axios';

import HeaderLb from "../components/header-lb.vue";

export default {
  components: {
    HeaderLb
  },
  data() {
   return {
     monthes: [
      { number: '1' },
      { number: '2' },
      { number: '3' },
      { number: '4' },
      ],
     lbmonth:{},
   }
 },
 mounted () {
    axios
      .get(`/api/v1/lbmonths/${this.$route.params.id}.json`)
      .then(response => (this.lbmonth = response.data))
  },
  methods: {
    updateLbmonth: function() {
      axios
        .patch(`/api/v1/lbmonths/${this.lbmonth.id}`, this.lbmonth)
        .catch(error => {
          console.error(error);
          if (error.response.data && error.response.data.errors) {
            this.errors = error.response.data.errors;
          }
        });
    },
  }
}
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/global.scss";
@import "./app/javascript/style/_mixin.scss";
.month {
  background-color:#FAF8EC;
  padding-bottom: 80px;
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
    background-color: white;
    padding: 48px;
    width: 94%;
    margin: 0 auto;
		.wrapper {
			.monthlist {
				.wrapper {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-between;
					.detail {
            width: calc(50% - 16px);
            height: 400px;
            padding: 24px 40px  24px 40px;
            &:nth-child(odd){
              border-right: 1px solid #f3f3f4;
            } 
            h4{
              @include fst-m;
              margin-bottom: 24px;
              .mini{
                font-size:12px;
                margin-left:4px;
              }
            }
            textarea{
              @include fsn-m;
              @include text;
                  height: 280px;
              border-bottom: 1px solid #f3f3f4;  
              &:nth-child(11),&:nth-child(12){
                border-bottom: none;
              }
            }
					}
				}
			}
		}
	}
}

@include sp{
  .month{
     .note{
      .wrapper{
         .monthlist{
           .wrapper{
              display: block;
              .detail{
                display: block;
                width: 100%;
                border: none;
                padding: 24px 24px 24px 24px;
                textarea{
                  height: 300px;
                }
              }
           }
         } 
      }
     }
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
          background-color: rgba(0,0,0,0.08);
          border-radius: 100px;
          padding: 12px 20px 10px 16px;
          transition: all 0.24s;
          &:hover{
            background-color: rgba(0,0,0,0.16);
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
   .header{
        padding: 20px 4px;
        margin-bottom: 48px;
    } 
}

</style>
