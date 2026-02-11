<template>
  <div class="editor-wrapper">
    <div class="toolbar">
      <button @click.prevent="format('bold')" title="Bold"><font-awesome-icon icon="bold" /></button>
      <button @click.prevent="format('italic')" title="Italic"><font-awesome-icon icon="italic" /></button>
      <button @click.prevent="format('underline')" title="Underline"><font-awesome-icon icon="underline" /></button>
      <button @click.prevent="format('strikeThrough')" title="Strikethrough"><font-awesome-icon icon="strikethrough" /></button>
      <button @click.prevent="addLink" title="Insert Link"><font-awesome-icon icon="link" /></button>
    </div>
    <div
      class="editor"
      contenteditable="true"
      ref="editor"
      @input="updateContent"
    ></div>
  </div>
</template>

<style scoped>
.editor-wrapper {
  width: 100%;
  font-family: sans-serif;
}

.toolbar {
  display: flex;
  gap: 8px;
  margin-bottom: 8px;
}

.toolbar button {
  padding: 4px 8px;
  cursor: pointer;
  font-size: 16px;
  background: #f0f0f0;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.toolbar button:hover {
  background-color: #ddd;
}

.editor {
  border: 1px solid #ccc;
  border-radius: 4px;
  min-height: 150px;
  padding: 8px;
  font-size: 16px;
  white-space: pre-wrap;
  overflow-y: auto;
}
</style>

<script>
export default {
  name: "RichTextEditor",
  data() {
    return {
      content: "",
    };
  },
  methods: {
    format(command) {
      document.execCommand(command, false, null);
      this.updateContent();
    },
    addLink() {
      const url = prompt("Enter URL:");
      if (url) {
        document.execCommand("createLink", false, url);
        this.updateContent();
      }
    },
    updateContent() {
      this.content = this.$refs.editor.innerHTML;
      this.$emit("input", this.content); // Optional: emit for v-model usage
    },
  },
};
</script>
