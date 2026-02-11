<template>
  <div>
    <RichTextEditor v-model="text" />
    <div class="output" v-html="text"></div>
  </div>
</template>

<script>
import RichTextEditor from "./RichTextEditor.vue";

export default {
  components: { RichTextEditor },
  data() {
    return {
      text: "",
    };
  },
};
</script>
