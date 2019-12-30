<template>
  <div class="reflection">
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
        <li @click="updateReflection" class="save">保存する</li>
      </ul>
    </nav>
  </header>
    <div class="title">
      <h3>今年の反省会</h3>
      <p>負の側面からポジティブな感情を見つけましょう</p>
      <p class="list">・やってみたいことに自分は取り組めていたか。を内省できる質問を用意してみました<br>・すべて答える必要はありません。ピンと来たものから取り組みましょう<br>・目安は20分です。自由に書きましょう<br>・フォーム内でEnterを押して改行すると自動的に保存されます。</p>
    </div>
    <div class="note">
      <ul class="quesitions">
        <li class="item">
          <h3 class="title">Q1.自分に欠けていたことはありますか？</h3>
          <textarea 
          v-model="reflection.missing" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="今足りないと思うこと。またそれは変えた方が良いことか想像してみましょう。"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q2. 重要ではないけど時間を使っていたことはありますか？</h3>
          <textarea 
          v-model="reflection.taking" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="普段時間を使っていたこと、自分のために使わないといけない時間。比較できると良いかもです。"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q3. "仕事"の心配なしに遊ぶことはできましたか？</h3>
          <textarea 
          v-model="reflection.worry" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="仕事が楽しい人もそうでない人も。遊びの感覚を持てているのか考えてみると良いのかも"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q4.罪悪感を感じた瞬間や出来事はありますか？</h3>
          <textarea 
          v-model="reflection.guilt" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="拒否反応を起こしていることは対処した方が良いかもしれません。"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q5.好きなだけ怒っていいなら何に対して怒りますか？</h3>
          <textarea 
          v-model="reflection.anger" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="怒りはこだわりに繋がったりするかもしれません"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q6.今のあなたの心配事は？</h3>
          <textarea 
          v-model="reflection.sorrow" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="気づかずに不安になっていたこととも向き合ってみましょう"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q7.今年嫉妬を感じたことはありますか？</h3>
          <textarea 
          v-model="reflection.jealousy" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="嫉妬は実は自分が欲しいと思うことなのかもしれません"></textarea>
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
    reflection:{},
   }
 },
 mounted () {
    axios
      .get(`/api/v1/lbreflections/${this.$route.params.id}.json`)
      .then(response => (this.reflection = response.data))
  },
  methods: {
    updateReflection: function() {
      axios
        .patch(`/api/v1/lbreflections/${this.reflection.id}`, this.reflection)
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
.reflection {
  background-color:#667695;
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
      @include eng_font;
      font-size: 14px;
      text-align: center;
      color: #fff;
      letter-spacing: 2px;
    }
    p.list{
      @include plist;
      border-top: 1px solid rgba(255, 255, 255, 0.32);
      border-bottom: 1px solid rgba(255, 255, 255, 0.32);
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
          background-color: rgba(255,255,255,0.84);
          border-radius: 100px;
          padding: 12px 20px 10px 16px;
          transition: all 0.24s;
          &:hover{
            background-color: rgba(255,255,255,0.64);
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
        box-shadow: 1px 1px 4px rgba(0,0,0,0.88);
        transition: all 0.4s;
        cursor: pointer;
        &:hover{
          background-color: white;
          color: #080725;
          font-weight: bold;
          box-shadow: 1px 1px 8px rgba(0,0,0,0.72);
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
