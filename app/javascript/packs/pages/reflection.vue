<template>
  <div class="reflection">
    <HeaderLb></HeaderLb>
    <div class="title">
      <h3>今年の内省リスト</h3>
      <p>負の側面からポジティブな感情を見つけましょう</p>
    </div>
    <div class="note">
      <ul class="quesitions">
        <li class="item">
          <h3 class="title">Q.今年最も欠けていたことはなんですか？</h3>
          <textarea 
          v-model="reflection.missing" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q.今年最も時間を使ってしまっていたことは？</h3>
          <textarea 
          v-model="reflection.taking" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q.今年、仕事の心配なしに遊ぶことはできましたか</h3>
          <textarea 
          v-model="reflection.worry" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q.罪悪感を感じた瞬間や出来事はありますか</h3>
          <textarea 
          v-model="reflection.guilt" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q.今、好きなだけ怒っていいなら何に対して怒りますか</h3>
          <textarea 
          v-model="reflection.anger" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q.今、あなたの心配事は</h3>
          <textarea 
          v-model="reflection.sorrow" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
        </li>
        <li class="item">
          <h3 class="title">Q.今年嫉妬を感じたこと</h3>
          <textarea 
          v-model="reflection.jealousy" 
          v-on:keypress.enter="updateReflection" name="" id="" cols="30" rows="10" placeholder="ここにテキストが入ります"></textarea>
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
      text-align: center;
      color: #fff;
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
        }
			}
		}
	}
}

</style>
