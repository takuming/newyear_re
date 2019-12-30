<template>
<transition>
    <div class="lookback">
      <HeaderIndex></HeaderIndex>
      <div class="note">
        <div class="title">
          <p class="items">PHASE 1</p>
          <h2>今年を振り返る</h2>
          <p>全部やってもいいし、気になるものだけやってもいいんです。</p>
        </div>
          <!-- テスト一覧を取得する -->
          <ul v-for="m in lbmonths" :key="m.id" class="lbmonths">
              <li>
                  <router-link  :to="{ name: 'LookbackMonth', params: { user_id:m.user_id, id:m.id } }">
                      <div class="left">
                        <p class="step">STEP1.</p>
                        <h3>🤔今年を思い出す - 月ごとに振り返ろう</h3>
                      </div>
                      <div class="right">
                        <img v-bind:src="require('../images/arrow_right.svg')" alt="arrow">
                      </div>    
                  </router-link>
              </li>
          </ul> 

          <ul v-for="r in lbreflections" :key="r.id" class="lbreflections">
              <li>
                  <router-link  :to="{ name: 'Reflection', params: { user_id:r.user_id, id:r.id } }">
                      <div class="left">
                        <p class="step">STEP2.</p>
                        <h3>😭今年の反省会 - 負の側面を振り返ろう</h3>
                      </div>
                      <div class="right">
                        <img v-bind:src="require('../images/arrow_right.svg')" alt="arrow">
                      </div>    
                  </router-link>
              </li>
          </ul>

          <ul v-for="c in lbcuriosities" :key="c.id" class="lbcuriosities">
              <li>
                  <router-link  :to="{ name: 'Curiosity', params: { user_id:c.user_id, id:c.id } }">
                      <div class="left">
                        <p class="step">STEP3.</p>
                        <h3>😎今年の発見 - ポジティブに感じたことを振り返ろう</h3>
                      </div>
                      <div class="right">
                        <img v-bind:src="require('../images/arrow_right.svg')" alt="arrow">
                      </div>    
                  </router-link>
              </li>
          </ul>
          
      </div>
    </div>
  </transition>
</template>

<script>
import axios from 'axios';
import HeaderIndex from "../components/header-index.vue";

export default {
  components: {
    HeaderIndex
  },
  data: function() {
    return {
      lbmonths:[],
      lbreflections:[],
      lbcuriosities:[],
      message: ""
    }
  },
  mounted(){
    axios
      .get('/api/v1/lbreflections.json')
      .then(response => (this.lbreflections = response.data));
    axios
      .get('/api/v1/lbmonths.json')
      .then(response => (this.lbmonths = response.data));
    axios
      .get('/api/v1/lbcuriosities.json')
      .then(response => (this.lbcuriosities = response.data))
  },
  methods: {
    createLbmonth: function(){
      axios
      .post('/api/v1/lbmonths', this.lbmonths)
      .then(response =>{
        this.$router.push({ name: 'LookbackMonth', params: { user_id:m.user_id, id:m.id } })
      })
    },
    createReflection: function(){
      axios
      .post('/api/v1/lbreflections', this.lbreflections)
      .then(response =>{
        this.$router.push({ name: 'Reflection', params: { user_id:r.user_id, id:r.id } });
      })
    },
    createLbcuriosity: function(){
      axios
      .post('/api/v1/lbcuriosities', this.lbcuriosities)
      .then(response =>{
        this.$router.push({ name: 'Curiosity', params: { user_id:c.user_id, id:c.id } });
      })
    },
  }
};
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/global.scss";
@import "./app/javascript/style/_mixin.scss";

.header{
  margin-bottom: 16px;
}
.lookback{
  background-image: url('../images/bg_paturn.jpg');
  background-size: contain;
    background-repeat: no-repeat;
    background-color: #FAF8EC;
    padding-bottom: 400px;
}
.note {
  @include note;
  width: 84%;
	.title {
		.items {
      @include eng_font;
      margin-bottom:20px;
      text-align: center;
    }
    h2{
      @include fst-l;
      margin-bottom: 20px;
      text-align: center;
    }
    p{
          line-height: 1;
    margin-bottom: 48px;
    text-align: center;
    font-size: 14px;

    }
  }
  ul{
    width: 60%;
    margin: 0 auto;
    li{
      cursor: pointer;
      a{
        display: flex;
      justify-content: space-between;
      padding: 32px 40px 20px;
      background-color: rgba(0,0,0,0.02);
      border-radius: 12px;
      margin-bottom: 20px;
      transition: all 0.24s ease-in;
      &:hover{
        background-color: rgba(0,0,0,0.08);
      }
      }
    }
  }
	   .left {
       .step{
         font-size: 10px;
         font-weight: bold;
         @include eng_font;
         margin-bottom: 8px;
       }
       h3{
         @include fst-xs;
         margin-bottom: 8px;
       }
       .direct{
         font-size: 10px;
         opacity: 0.56;
         a{
           padding: 0;
           margin: 0;
           &:hover{
             background: none;
             text-decoration: underline;
             color: blue;
           }
         }
       }
	    }
	   .right {
       img{
         padding: 16px 0px;
       }
	    }
}

@include sp{
  .note {
    ul{
    margin: 0;
    width: 100%;
     li{
       a{
         padding: 32px 20px 20px;
       }
     }
    }
  }
}
</style>
