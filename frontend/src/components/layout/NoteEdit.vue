<template>
  <div>
    <div ref="editor" class="border rounded min-h-[200px]"></div>
  </div>
</template>

<script setup>
import { ref, onMounted, watch } from 'vue'
import Quill from 'quill'
import 'quill/dist/quill.snow.css'

const editor = ref(null)
const quill = ref(null)

const emit = defineEmits(['update:modelValue'])
const props = defineProps({
  modelValue: {
    type: String,
    default: '',
  },
})

onMounted(() => {
  quill.value = new Quill(editor.value, {
    theme: 'snow',
    modules: {
      toolbar: [
        ['bold', 'italic', 'underline'],
        ['link'],
        [{ list: 'ordered' }, { list: 'bullet' }],
        ['clean'],
      ],
    },
  })

  // initial set (create mode)
  if (props.modelValue) {
    quill.value.clipboard.dangerouslyPasteHTML(props.modelValue)
  }

  quill.value.on('text-change', () => {
    emit('update:modelValue', quill.value.root.innerHTML)
  })
})

/* 🔥 INI KUNCI UNTUK MODE EDIT */
watch(
  () => props.modelValue,
  (newVal) => {
    if (!quill.value) return

    const currentHTML = quill.value.root.innerHTML
    if (newVal !== currentHTML) {
      quill.value.clipboard.dangerouslyPasteHTML(newVal || '')
    }
  }
)
</script>
