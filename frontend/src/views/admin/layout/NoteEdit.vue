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
        default: ''
    }
})

onMounted(() => {
    quill.value = new Quill(editor.value, {
        theme: 'snow',
        modules: {
            toolbar: [
                ['bold', 'italic', 'underline'],
                ['link'],
                [{ list: 'ordered' }, { list: 'bullet' }],
                ['clean']
            ]
        }
    })

    // set initial value
    quill.value.root.innerHTML = props.modelValue
    //
    quill.value.on('text-change', () => {
        emit('update:modelValue', quill.value.root.innerHTML)
    })

})


watch(
    () => props.modelValue,
    (newValue) => {
        if (quill.value && newValue !== quill.value.root.innerHTML) {
            quill.value.root.innerHTML = newValue || ''
        }
    }
)

</script>
