
<template lang="pug">
  <footer class="footer">
  <p><a href="https://www.notion.so/takumikai/48b0524200e144c484052b8e31277c14">プライバシーポリシー</a></p>
  <p><a href="https://www.notion.so/takumikai/NEWYEAR-67d94aff1869478b92f063b0f6d1ed97">利用規約</a></p>
  <p><a data-method="delete"  href="/users/sign_out">ログアウト</a></p>
  <div class="copyright">
    <p>©2019-2020 takumikai</p>
  </div>
  </footer>
  
</template>

<script>
export default {};
</script>

<style lang="scss" scoped>
@import "./app/javascript/style/_mixin.scss";
.footer{
  display: flex;
    justify-content: space-evenly;
    padding: 32px 0;
    width: 40%;
    margin: 0 auto;
    font-size: 12px;
    margin-top: 170px;
    p{
      a{
        text-decoration: none;
        color: #000;
      }
    }
}

@include sp{
.footer{
    width: 100%;
    display: block;
    p{
      text-align: center;
    font-size: 16px;
    margin: 16px 0;
      a{
      }
    }
 }
}
  

</style>
