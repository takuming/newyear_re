<template>
  <div id="app">
    <div class="wrapper">
    <Header></Header>
    <div class="index_wrapper">
        <div class="title">
          <h2>3ステップで<br>好奇心と出会おう</h2>
          <p>目標を立てる３テップを用意しました。<br>
全てやってもいいし、気になるところだけでも。気持ちが向くものからどうぞ。</p>
        </div>
        <div class="section_contents">
          <ul v-on:click="createLookback"  class="content_wrapper">
              <li class="content _lookback">
              <router-link :to="{name:'OpMonth'}">
                <div class="img">
                  <img v-bind:src="require('./packs/images/note_lookback.png')">
                </div>
                <div class="text">
                  <span>PHASE 1</span>
                  <h3>今年を振り返る</h3>
                  <!-- <p>今年を振り返りどんな１年だったかを明らかにしましょう。</p> -->
                </div>
              </router-link>
              </li>

            <li v-for="e in effort" :key="e.id"  class="content _interest">
              <router-link :to="{ name: 'Effort', params: { user_id:e.user_id, id:e.id } }">
              <div class="img">
                <img v-bind:src="require('./packs/images/note_interest.png')">
              </div>
              <div class="text">
                <span>PHASE 2</span>
                <h3>取り組みたいことを挙げる</h3>
                <!-- <p>変えたいこと、挑戦したいこと。今の自分がうっすらと感じていることを明らかにします。</p> -->
              </div>
              </router-link>
            </li>
            
            <li class="content _goalset">
              <router-link :to="{ name: 'OpGoal'}">
              <div class="img">
                <img v-bind:src="require('./packs/images/note_goalset.png')">
              </div>
              <div class="text">
                <span>PHASE 3</span>
                <h3>2020年の目標を立てる</h3>
                <!-- <p>新しい年を生きるためのイメージを明確にしてみましょう。</p> -->
              </div>
              </router-link>
            </li>
          </ul>
        </div>
    </div>
    <div>
    </div>
    <Footer></Footer>

    </div>
  </div>
</template>


<script>
import axios from 'axios';

import Header from "./packs/components/header.vue";
import Footer from "./packs/components/footer.vue";

export default {
  components: {
    Header,
    Footer
  },
  data: function() {
    return {
      effort:[],
      message: "",
      info:null,
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
      .then(response => (this.effort = response.data))
  },
  methods:{
    createLookback: function(){
      axios
      .post('/api/v1/lbmonths', this.lbmonths);
      axios
      .post('/api/v1/lbreflections', this.lbreflections);
      axios
      .post('/api/v1/lbcuriosities', this.lbcuriosities)
    }
  },
};
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/global.scss";
@import "./app/javascript/style/_mixin.scss";

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
