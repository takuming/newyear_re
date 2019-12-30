<template>
<transition name="fade">
    <div id="demo" class="opening">
      <div class="wrapper">
        
            <div class="sec-first">
              <div class="title">
                <p>PHASE3</p>
                <h3>目標をつくろう</h3>
                <p class="text">好奇心を行動に移そう</p>
              </div>
            </div>
      </div> 
    </div>
</transition>
</template>

<script>
export default {
  el: '#demo',
  data() {
    return {
      show:true
    }
  },
  mounted () {
      setTimeout(
            function() {
              this.$router.push({path:'/setgoal'})
            }.bind(this),
            2000
          );
  }
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
  background-color: #FAF5EC;
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
         margin-bottom: 8px;
         text-align: center;
    }
    h3{
      @include fst-l;
      margin-bottom: 20px;
      letter-spacing: 3px;
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
