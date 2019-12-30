<template>
  <div class="curiosity">
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
        <li  @click="updateCuriosity" class="save">保存する</li>
      </ul>
    </nav>
  </header>
    <div class="title">
      <h3>今年の発見</h3>
      <p>ワクワクしたことを思い出してみましょう</p>
      <p class="list">・ポジティブに気持ちが動いたことを思い出しましょう<br>・すべて答える必要はありません。ピンと来たものから取り組みましょう<br>・目安は20分。小さなワクワクも書き出してみましょう<br>・フォーム内でEnterを押して改行すると自動的に保存されます。</p>
    </div>
    <div class="note">
      <ul class="quesitions">
        <li class="item">
          <h3 class="title">Q1.今年最も集中できた/夢中になれたこと</h3>
          <textarea 
          v-model="curiosity.trance" 
          v-on:keypress.enter="updateCuriosity" name="" id="" cols="30" rows="10" placeholder="時を忘れたことは何であってもやってて楽しいということです。多分。"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q2.今年ポジティブに感じた行動は？</h3>
          <textarea 
          v-model="curiosity.positive" 
          v-on:keypress.enter="updateCuriosity" name="" id="" cols="30" rows="10" placeholder="気持ちの良い行動だけして出来るだけ生きてみたい"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q3.今年面白そうと感じたけどできなかったことは？</h3>
          <textarea 
          v-model="curiosity.interesting" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="好奇心のアンテナを掘り起こしてみましょう"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q4.今年心地よく感じた瞬間、人、場所は？</h3>
          <textarea 
          v-model="curiosity.comfortable" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="お金を出しても手に入らないものかもしれません"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q5.今、好きなだけ時間を使えるなら未来のために何をしますか？</h3>
          <textarea 
          v-model="curiosity.theme" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="未来って大げさだけど、明日を少しだけよくする何かかも"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q6.今、深掘りしてみたいテーマはありますか？</h3>
          <textarea 
          v-model="curiosity.investment" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="やってみたいことなら何でも良いので書き出してみましょう"></textarea>
        </li>
      </ul>
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
     questions: [
      { title: '今年あなたに最も欠けていたことはなんですか？' },
      { title: '今年最も時間を使ってしまっていたことは？' },
      { plholder: '能力、時間、感情・・・・・なんでも書き出してみましょう。' },
      { plholder: 'この月にあったことを2つ~５つなんでも書き出そう' },
    ],
    curiosity:{},
   }
 },
 mounted () {
    axios
      .get(`/api/v1/lbcuriosities/${this.$route.params.id}.json`)
      .then(response => (this.curiosity = response.data))
  },
  methods: {
    updateCuriosity: function() {
      axios
        .patch(`/api/v1/lbcuriosities/${this.curiosity.id}`, this.curiosity)
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
.header{
  color: white;
  .save{
    color: #000;
  }
}
.curiosity {
  background-color:#F1F2CA;
  padding-bottom: 80px;
	.title {
    margin-bottom: 48px;
    h3{
      @include fst-l;
      text-align: center;
      margin-bottom: 8px;
      color: #000;
    }
    p{
      @include fsn-s;
      text-align: center;
      color: #000;
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
		.quesitions {
			.item {
        border-bottom: 1px solid #f3f3f4;
        margin-bottom: 64px;
				.title {
          @include fst-s;
          margin-bottom: 24px;
        }
        textarea{
        @include fsn-m; 
        @include text; 
         height: 160px;
        }
			}
		}
	}
}


.header {
  background: none;
  padding: 20px 32px;
  position: relative;
  padding: 10px 32px;
  height: 88px;
	.nav {
		.wrapper {
      display: flex;
      justify-content: space-between;
      width: 100%;
			.back {
        padding: 12px 16px;
        a{
          display: flex;
          justify-content: space-between;
          text-decoration: none;
          background-color: rgba(0,0,0,0.08);
          border-radius: 100px;
           transition: all 0.24s;
          padding: 12px 20px 10px 16px;
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
  .header {
    padding: 10px 0px;
  }
}

</style>
