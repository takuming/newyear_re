<template>
  <div class="focus">
    <header class="header">
    <nav class="nav">
      <ul class="wrapper">
        <li class="back">
          <router-link to="/">
              <span class="icon">
                <img v-bind:src="require('../images/close.svg')" alt="arrowback">
              </span>
              <p>戻る</p>  
          </router-link>
        </li>
        <li @click="updateEffort" class="save">保存する</li>
      </ul>
    </nav>
  </header>
    <div class="title">
      <p>PHASE2</p>
      <h3>取り組みたいことを書き上げる🎖</h3>
      <p class="list">・今、興味があることを書き出せる質問を用意しました。<br>・すべて答える必要はありません。ワクワクするものが見つかれば良いのです<br>・目安は20分です。自由に書きましょう<br>・フォーム内でEnterを押して改行すると自動的に保存されます。</p>
    </div>
    <div class="note">
      <ul class="quesitions">
        <li class="item">
          <h3 class="title">Q1.来年変えたいことを書き出してみましょう</h3>
          <textarea 
          v-model="effort.change" 
          v-on:keypress.enter="updateEffort"  name="" id="" cols="30" rows="10" placeholder="思いついたらとりあえず書き出しまくるのがオススメです"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q2.来年もつづけたいこと</h3>
          <textarea v-model="effort.keep" 
          v-on:keypress.enter="updateEffort" 
          name="" id="" cols="30" rows="10" placeholder="継続は力なり〜〜"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q3.チャレンジしたいこと</h3>
          <textarea v-model="effort.challenge" name="" id="" cols="30" rows="10" placeholder="実現できることもできないことも。計画を立てるのも良いかも。"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q4.周りに与えたい影響</h3>
          <textarea v-model="effort.influence" name="" id="" cols="30" rows="10" placeholder="逆にいうとどういう自分であるべきかが見えてきます"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q5.どんな習慣を持ちたい、またそれはなぜか</h3>
          <textarea v-model="effort.surround" name="" id="" cols="30" rows="10" placeholder="取り組んでいくには習慣と友達になれると良いかもですよね・・・"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q6.どんな感情で来年を終えたいか</h3>
          <textarea v-model="effort.endofyear" name="" id="" cols="30" rows="10" placeholder="最終的に来年どういう年にしたいのか。イメージでも。"></textarea>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

import HeaderIndex from "../components/header-index.vue";

export default {
  components: {
    HeaderIndex
  },
 data() {
   return {
     questions: [
      { title: '変えたいこと' },
      { title: 'つづけたいこと' },
      { title: 'チャレンジしたいこと' },
      { title: 'どんな影響を周りの人に与えたい' },
      { title: 'どんな習慣を持ちたい' },
      { title: 'どんな感情で来年を終えたい' },
      { plholder: '能力、時間、感情・・・・・なんでも書き出してみましょう。' },
      { plholder: 'この月にあったことを2つ~５つなんでも書き出そう' },
      { plholder: '能力、時間、感情・・・・・なんでも書き出してみましょう。' },
      { plholder: 'この月にあったことを2つ~５つなんでも書き出そう' },
      { plholder: '能力、時間、感情・・・・・なんでも書き出してみましょう。' },
      { plholder: 'この月にあったことを2つ~５つなんでも書き出そう' },
    ],
    effort:{},
   }
 },
 mounted () {
    axios
      .get(`/api/v1/efforts/${this.$route.params.id}.json`)
      .then(response => (this.effort = response.data))
  },
  methods: {
    updateEffort: function() {
      axios
        .patch(`/api/v1/efforts/${this.effort.id}`, this.effort)
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
.focus {
  background-color:#FFF5EF;
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
          background-color: rgba(0,0,0,0.04);
          border-radius: 100px;
          padding: 12px 20px 10px 16px;
          transition: all 0.24s;
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
   .header{
        padding: 20px 4px;
        margin-bottom: 48px;
    } 
}



</style>
