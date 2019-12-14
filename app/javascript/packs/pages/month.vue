<template>
  <div class="month">
    <HeaderLb></HeaderLb>
    <div class="note">
      <div class="wrapper">
          <div class="title">
            <h3>上半期をふりかえろう🧐</h3>
          </div>
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
                <h4>1月</h4>
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
                <h4>2月</h4>
                <textarea v-model="lbmonth.feb" name="" id="" cols="30" rows="10" 
                placeholder="この月にあったことを2つ~５つなんでも書き出そう
                ・仕事であったこと
                ・恋愛であったこと
                ・旅行先
                ・考えたこと
                ・感感情が動いたこと
                etc">
                </textarea>
              </li>
              <li class="detail">
                <h4>3月</h4>
                <textarea v-model="lbmonth.mar" name="" id="" cols="30" rows="10" 
                placeholder="この月にあったことを2つ~５つなんでも書き出そう
                ・仕事であったこと
                ・恋愛であったこと
                ・旅行先
                ・考えたこと
                ・感感情が動いたこと
                etc">
                </textarea>
              </li>
              <li class="detail">
                <h4>4月</h4>
                <textarea v-model="lbmonth.apr" name="" id="" cols="30" rows="10" 
                placeholder="この月にあったことを2つ~５つなんでも書き出そう
                ・仕事であったこと
                ・恋愛であったこと
                ・旅行先
                ・考えたこと
                ・感感情が動いたこと
                etc">
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
	.note {
    @include note;
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
        h3{
          @include fst-l;
          text-align: center;
          margin-bottom: 32px;
        }
			}
			.monthlist {
				.wrapper {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-between;
					.detail {
            width: calc(44% - 16px);
            height: 400px;
            padding: 24px 40px  24px 40px;
            &:nth-child(odd){
              border-right: 1px solid #f3f3f4;
            }
            &:nth-child(1),&:nth-child(2){

              border-bottom: 1px solid #f3f3f4;
            }
            
            h4{
              @include fst-m;
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
	}
}
</style>
