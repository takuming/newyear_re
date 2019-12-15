<template>
    <div id="demo" class="opening">
      <div class="wrapper">

        <transition name="fade">
        <div v-if="show" class="sec-first">
          <div class="title">
            <p></p>
            <h3></h3>
          </div>
          <div class="text">
            負を感じることは
実は欲望の望みの裏返しであることがあります
ふりかえることでやりたいことを見つけましょう
          </div>
          <div v-on:click="show = !show" class="button">
            <p>ネクスト</p>
          </div>
        </div>
        <div v-else class="sec-first second">
          <div class="title">
            <p></p>
            <h3></h3>
          </div>
          <div class="text">
            負を感じることは
実は欲望の望みの裏返しであることがあります
ふりかえることでやりたいことを見つけましょう
          </div>
          <div class="button">
            <router-link to="/lookback/month/1">
            <p>移動するよ</p>
            </router-link>
          </div>
        </div>
        </transition>

        
      </div> 
    </div>
</template>

<script>
export default {
  el: '#demo',
  data() {
    return {
      show:true
    }
  },
}
</script>

<style lang="scss" scoped>

@import "./app/javascript/style/global.scss";
@import "./app/javascript/style/_mixin.scss";

.fade-enter {
  transform: translate(0px, -8px);
  opacity: 0;
}
.fade-enter-to {
  opacity: 1;
}
.fade-enter-active {
  transition: all 1s 0s ease;
}
.fade-leave {
  transform: translate(0, 0);
  opacity: 1;
}
.fade-leave-to {
  transform: translate(0px, -8px);
  opacity: 0;
}
.fade-leave-active {
  transition: all .5s 0s ease;
}

.opening{
  background-color: #FAF8EC;
      width: 100%;
    height: 100%;
    position: absolute;
  .wrapper{}
}


.sec-first {
  position: absolute;
	top: 50%;
	left: 50%;
  transform: translate(-50%, -50%);
  width: 64%;
	.title {
    color: #000;
    text-align: center;
    p{
      font-size: 12px;
         font-weight: bold;
         @include eng_font;
         margin-bottom: 4px;
         text-align: center;
    }
    h3{
      @include fst-l;
      margin-bottom: 48px;
      text-align: center;
    }
	}
	.text {
    color: #000;
    font-size: 12px;
    text-align: center;
    margin: 0 auto 24px;
	}
	.button {
    padding: 24px 16px;
    background-color: #fff;
    border-radius: 100px;
    width: 200px;
    margin: 0 auto;
    color: #000;
    font-weight: bold
	}
}
// .sec-first.second {
//   display: none;
// }

</style>
