<template>
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
</template>

<script>
export default {
  
}
</script>

<style lang="scss" scoped>

@import "./app/javascript/style/_mixin.scss";
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
          background-color: rgba(0,0,0,0.04);
          border-radius: 100px;
           transition: all 0.24s;
          padding: 12px 20px 10px 16px;
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
