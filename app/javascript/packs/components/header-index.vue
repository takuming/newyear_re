<template>
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
          background-color: white;
          border-radius: 100px;
          padding: 12px 16px 10px;
          opacity: 0.92;
          transition: all 0.24s;
          box-shadow: 1px 1px 16px rgba(0,0,0,0.12);
          &:hover{
            opacity: 0.64;
          }
          .icon {
            margin-right: 12px
          }
          p{
          font-size:14px;
          font-weight: bold;
          line-height: 0;
          height: 8px;
          padding: 12px 0;
          }
          
        }
				
			}
			.save {
        padding: 12px 16px;
        font-size: 14px;
        background-color: #fff;
        border-radius: 100px;
			}
		}
	}
}

@include sp{
  .header {
    padding: 12px 0px;
  }
}
</style>
