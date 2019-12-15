<template>
  <div class="curiosity">
    <HeaderLb></HeaderLb>
    <div class="title">
      <h3>今年の内省リスト</h3>
      <p>負の側面からポジティブな感情を見つけましょう</p>
    </div>
    <div class="note">
      <ul class="quesitions">
        <li class="item">
          <h3 class="title">Q.今年最も集中できた/夢中になれたこと</h3>
          <textarea 
          v-model="curiosity.trance" 
          v-on:keypress.enter="updateCuriosity" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q.今年ポジティブに感じた行動は？</h3>
          <textarea 
          v-model="curiosity.positive" 
          v-on:keypress.enter="updateCuriosity" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q.今年面白そうと感じたけどできなかったことは？</h3>
          <textarea 
          v-model="curiosity.interesting" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q.今年心地よく感じた瞬間、人、場所は？</h3>
          <textarea 
          v-model="curiosity.comfortable" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q.今、好きなだけ時間を使えるなら未来のために何をする？</h3>
          <textarea 
          v-model="curiosity.theme" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li  class="item">
          <h3 class="title">Q.今、深掘りしてみたいテーマはありますか？</h3>
          <textarea 
          v-model="curiosity.investment" 
          v-on:keypress.enter="updateCuriosity"name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
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
  background-color:#FEFFC8;
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
	}
	.note {
    @include note;
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
        }
			}
		}
	}
}

</style>
