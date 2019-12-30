<template>
  <header class="header">
    <nav class="nav">
      <ul class="wrapper">
        <li class="about">
          <a href="https://note.com/design_school/n/na519d684aa05"  target="_blank"> サービスについて</a>
         </li>
        <li class="ci">
          <img v-bind:src="require('../images/logo.svg')" alt="newyear">
          </li>
        <li class="account">
          <a data-method="delete"  href="/users/sign_out">ログアウト</a> 
        </li>
      </ul>
    </nav>
  </header>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      user: {}
    }
  },
   mounted () {
    axios
      .get(`/api/v1/users/${this.$route.params.id}.json`)
      .then(response => (this.user = response.data))
  },
}
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/_mixin.scss";

.header {
  background: none;
  width: 92%;
  padding: 32px 0px;
  margin: 0 auto 48px;
  position: relative;
	.nav {
		.wrapper {
      display: flex;
      justify-content: space-between;
      width: 100%;
      .about{
        font-size: 14px;
        font-weight: bold;
        padding: 24px 0;
        
          a{
            text-decoration: none;
          color: #080725;
          &:hover{
            opacity: 0.88;
          }
          }
      }
      .ci{}
      .account{
        font-size: 14px;
        font-weight: bold;
        padding: 24px 0;
        a{
          text-decoration: none;
          color: #080725;
          &:hover{
            opacity: 0.88;
          }
        }
      }
		}
	}
}
@include sp{
  .header {
    margin-bottom: 80px;
	.nav {
		.wrapper {
          display: block;
          text-align: center;
      .about{
        display: none;
      }
      .ci{}
      .account{
        display: none;
        a{
          }
        }
      }
		}
	}
}

</style>


