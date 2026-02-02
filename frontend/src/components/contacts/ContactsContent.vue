<template>
    <div class="py-1">
        <div class="mx-auto sm:px-6 lg:px-8">
            <div name="header" class="mt-2 p-2">
                <h1 class="font-bold text-xl text-gray-800">
                    CONTACTS
                </h1>
                <hr>
            </div>
            <div :class="messageClass" name="message" class="mt-2 p-2">
                {{ message }}
            </div>
            <div class="mt-3 grid grid-cols-2">
                <form class="flex items-center">
                    <div class="relative w-full">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
                            <svg aria-hidden="true" class="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor"
                                viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd"
                                    d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
                                    clip-rule="evenodd"></path>
                            </svg>
                        </div>
                        <input
                            type="search"
                            v-model="search"
                            placeholder="Search event..."
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg block w-full pl-10 p-2.5"
                        />
                    </div>
                </form>
                <div class="flex flex-row-reverse">
                    <button @click="openCreateModal"
                    class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                    Create New Contact
                    </button>
                </div>
            </div>

            <div :class="createClass" class="fixed inset-0 bg-gray-900 bg-opacity-75 flex items-start justify-center p-4 overflow-y-auto sm:items-center z-50 p-4">
                <div class="flex flex-row max-w-lg w-full">
                    <div class="w-full bg-white rounded-xl shadow-2xl overflow-y-auto max-h-screen sm:max-h-[90vh]">
                        <div class="py-1">
                            <div class="sm:px-6 lg:px-8">
                               
                                <div name="header" class="mt-2 p-2 text-center">
                                    <h1 class="font-bold text-xl text-gray-800">
                                        CREATE CONTACT
                                    </h1>
                                    <hr>
                                </div>
                                <form @submit.prevent>
                                    <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
                                        <label for="company_id"
                                            class="block text-gray-700 text-sm font-bold my-2">
                                            Company
                                        </label>
                                        <div class="flex flex-row">
                                            <select v-model="form.company_id"
                                                class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                                <option value=0 disabled selected>Select Company</option>
                                                <option v-for="company in companies" :key="'company' + company.id" :value="company.id" required>{{ company.company_name }}</option>
                                            </select>
                                        </div>
                                        <div class="mt-4 mb-4">
                                            <label for="contact_gender" class="block text-gray-700 text-sm font-bold my-2">
                                                Gender
                                            </label>
                                            <select v-model="form.contact_gender"
                                                class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black block w-full p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                                <option value="" selected disabled>Select Option</option>
                                                <option value="Mr.">Mr. </option>
                                                <option value="Mrs.">Mrs. </option>
                                                <option value="Ms.">Ms. </option>
                                            </select>
                                        </div>
                                        <div class="mt-4 mb-4">
                                            <label for="first_name" class="block text-gray-700 text-sm font-bold my-2">
                                                First Name
                                            </label>
                                            <input type="text" v-model="form.first_name"
                                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                id="first_name" placeholder="Enter First Name">
                                        </div>
                                        <div class="mt-4 mb-4">
                                            <label for="last_name" class="block text-gray-700 text-sm font-bold my-2">
                                                Last Name
                                            </label>
                                            <input type="text" v-model="form.last_name"
                                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                id="last_name" placeholder="Enter Last Name">
                                        </div>
                                        <div class="mb-4">
                                            <label for="title" class="block text-gray-700 text-sm font-bold my-2">
                                                Title
                                            </label>
                                            <input type="text" v-model="form.title"
                                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                id="title" placeholder="Enter Title">
                                        </div>

                                        <div class="flex mb-4">
                                            <div class="w-full">
                                                <label for="phone_code" class="block text-gray-700 text-sm font-bold my-2">
                                                    Country
                                                </label>
                                                <select v-model="phone.code"
                                                    class="w-full bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-black focus:border-black p-2.5 dark:text-black dark:focus:ring-black dark:focus:border-black">
                                                    <option value="" disabled selected>Select Country</option>
                                                    <option v-for="code in countryCodes" :key="'code' + code.code" :value="code.code" required>{{ code.name }} ({{ code.code }})</option>
                                                </select>
                                            </div>
                                        </div>

                                        <label for="phone_" class="block text-gray-700 text-sm font-bold my-2">
                                            Phone Number
                                        </label>
                                        <div class="flex mb-4">
                                            <div>
                                                 <input type="tel" v-model="phone.code" readonly
                                                    class="shadow appearance-none border rounded w-24 py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                                            </div>
                                            <div class="w-full">
                                                <input type="tel" v-model="phone.number"
                                                    class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                    id="phone_number" placeholder="Enter Phone Number">
                                            </div>
                                        </div>

                                        <div class="mb-4">
                                            <label for="email" class="block text-gray-700 text-sm font-bold my-2">
                                                Email
                                            </label>
                                            <input type="text" v-model="form.email"
                                                class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                                                id="email" placeholder="Enter Email">
                                        </div>

                                        <div class="bg-gray-50 px-4 py-3 sm:px-6 sm:flex sm:flex-row-reverse">
                                            <span :class="submitClass" class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                                <button type="button" @click="submitContact"
                                                    class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                                    Save
                                                </button>
                                            </span>
                                            <span :class="editClass" class="flex w-full rounded-md shadow-sm sm:ml-3 sm:w-auto">
                                                <button type="button" @click="editContact(form.id)"
                                                    class="inline-flex justify-center w-full rounded-md border border-transparent px-4 py-2 bg-green-600 text-base leading-6 font-medium text-white shadow-sm hover:bg-green-500 focus:outline-none focus:border-green-700 focus:shadow-outline-green transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                                    Save Edit
                                                </button>
                                            </span>
                                            <span class="mt-3 flex w-full rounded-md shadow-sm sm:mt-0 sm:w-auto">
                                                <button type="button" @click="closeCreateModal"
                                                    class="inline-flex justify-center w-full rounded-md border border-gray-300 px-4 py-2 bg-white text-base leading-6 font-medium text-gray-700 shadow-sm hover:text-gray-500 focus:outline-none focus:border-blue-300 focus:shadow-outline-blue transition ease-in-out duration-150 sm:text-sm sm:leading-5">
                                                    Cancel
                                                </button>
                                            </span>
                                        </div>
                                    </div>
                                </form>
                                      
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sesuaikan jumlah kolom beserta gap jika ingin merubah jumlah data yang ditampilkan-->
            <div class="grid grid-cols-3 gap-2">
                <div v-for="contact in filteredContacts" :key="contact.id">
                    <article class="flex flex-col h-full px-4 py-3 rounded-md shadow-md bg-white border border-gray-600">
                        <div class="flex flex-row-reverse mt-2">
                            <span
                                class="text-sm font-light text-gray-800 dark:text-gray-800"> {{ contact.user.name }} || {{ formatDate(contact.created_at) }}</span>
                        </div>
                        <div>
                            <h1 class="mt-2 text-lg font-semibold text-gray-800 dark:text-black">
                                {{ contact.first_name }} {{ contact.last_name }}
                            </h1>
                        </div>
                        <div class="flex-grow font-normal text-sm text-gray-800">
                            <div class="flex flex-row mt-1">
                                <div><font-awesome-icon icon="building" /></div>
                                <div class="ml-1 break-words">
                                    {{ contact.company.company_name }} 
                                </div>
                            </div>
                            <div class="flex flex-row mt-1">
                                <div><font-awesome-icon icon="thumbtack" /></div>
                                <div class="ml-1 break-words">
                                    {{ contact.title }} 
                                </div>
                            </div>
                            <div class="flex flex-row mt-1">
                                <div><font-awesome-icon icon="phone" /></div>
                                <div class="ml-1">
                                    {{ contact.phone_number }} 
                                </div>
                            </div>
                            <div class="flex flex-row mt-1">
                                <div><font-awesome-icon icon="envelope" /></div>
                                <div class="ml-1 break-all">
                                    {{ contact.email }} 
                                </div>
                            </div>
                        </div>
                        <div class="">
                            <div class="flex flex-row-reverse">
                                <button @click="openDeleteModal(contact.id)"
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="trash" />
                                </button>
                                <button @click="openEditModal(contact.id)"
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="pen" />
                                </button>
                                <button
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="magnifying-glass" />
                                </button>
                            </div>
                        </div>
                        
                    </article>
                </div> 
            </div>

            <div v-for="contact in contacts" :key="'delete-' + contact.id" >
                <div v-if="openDeleteModalId === contact.id"
                    class="fixed inset-0 bg-gray-900 bg-opacity-75 flex items-center justify-center z-50 p-4">
                    <div class="flex flex-row max-w-lg w-full">
                        <div class="w-full bg-white rounded-xl shadow-2xl overflow-hidden">
                            <div class="py-1">
                                <div class="sm:px-6 lg:px-8">
                                    <div name="header" class="mt-4 p-2">
                                        <h1 class="font-bold text-2xl text-center text-gray-800">
                                            DELETE CONTACT
                                        </h1>
                                        <hr class="mt-2 border-gray-200">
                                    </div>

                                    <div class="my-6 py-2 text-center">
                                        <p class="text-lg text-gray-700">Are you sure you want to delete 
                                            <b class="text-red-600">"{{ contact.first_name }} {{ contact.last_name }}"</b>?
                                        </p>
                                    </div>

                                    <div class="bg-gray-50 p-4 flex justify-between space-x-4">
                                        <!-- Cancel Button -->
                                        <button type="button" @click="closeDeleteModal"
                                                class="flex-1 rounded-md border border-gray-300 px-4 py-2 bg-white text-base font-medium text-gray-700 shadow-sm hover:bg-gray-100 transition ease-in-out duration-150">
                                            Cancel
                                        </button>

                                        <!-- Delete Button -->
                                        <button type="button" @click="deleteContact(contact.id)"
                                                class="flex-1 rounded-md border border-transparent px-4 py-2 bg-red-600 text-base font-medium text-white shadow-sm hover:bg-red-700 transition ease-in-out duration-150">
                                            Delete
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
import { onMounted, reactive, ref, computed, watch } from 'vue'
import axios from 'axios'
import dayjs from 'dayjs'
import { useRoute, useRouter } from 'vue-router'

const route = useRoute()
const router = useRouter()
const contacts = ref([])
const companies = ref([])
const createClass = ref("hidden")
const submitClass = ref("")
const editClass = ref("")
const search = ref("")

const openEditModalId = ref(false)

const openDeleteModalId = ref(null)
const deletedContactId = ref(null)

const message = ref('');
const messageClass = ref('hidden');

const BASE_URL = 'http://localhost:8080'

const countryCodes = ref([
    
  { name: 'Afghanistan', code: '+93' },
  { name: 'Albania', code: '+355' },
  { name: 'Algeria', code: '+213' },
  { name: 'American Samoa', code: '+1-684' },
  { name: 'Andorra', code: '+376' },
  { name: 'Angola', code: '+244' },
  { name: 'Anguilla', code: '+1-264' },
  { name: 'Antarctica', code: '+672' },
  { name: 'Antigua and Barbuda', code: '+1-268' },
  { name: 'Argentina', code: '+54' },
  { name: 'Armenia', code: '+374' },
  { name: 'Aruba', code: '+297' },
  { name: 'Australia', code: '+61' },
  { name: 'Austria', code: '+43' },
  { name: 'Azerbaijan', code: '+994' },
  { name: 'Bahamas', code: '+1-242' },
  { name: 'Bahrain', code: '+973' },
  { name: 'Bangladesh', code: '+880' },
  { name: 'Barbados', code: '+1-246' },
  { name: 'Belarus', code: '+375' },
  { name: 'Belgium', code: '+32' },
  { name: 'Belize', code: '+501' },
  { name: 'Benin', code: '+229' },
  { name: 'Bermuda', code: '+1-441' },
  { name: 'Bhutan', code: '+975' },
  { name: 'Bolivia', code: '+591' },
  { name: 'Bosnia and Herzegovina', code: '+387' },
  { name: 'Botswana', code: '+267' },
  { name: 'Brazil', code: '+55' },
  { name: 'British Indian Ocean Territory', code: '+246' },
  { name: 'British Virgin Islands', code: '+1-284' },
  { name: 'Brunei', code: '+673' },
  { name: 'Bulgaria', code: '+359' },
  { name: 'Burkina Faso', code: '+226' },
  { name: 'Burundi', code: '+257' },
  { name: 'Cambodia', code: '+855' },
  { name: 'Cameroon', code: '+237' },
  { name: 'Canada', code: '+1' },
  { name: 'Cape Verde', code: '+238' },
  { name: 'Cayman Islands', code: '+1-345' },
  { name: 'Central African Republic', code: '+236' },
  { name: 'Chad', code: '+235' },
  { name: 'Chile', code: '+56' },
  { name: 'China', code: '+86' },
  { name: 'Christmas Island', code: '+61' },
  { name: 'Cocos Islands', code: '+61' },
  { name: 'Colombia', code: '+57' },
  { name: 'Comoros', code: '+269' },
  { name: 'Cook Islands', code: '+682' },
  { name: 'Costa Rica', code: '+506' },
  { name: 'Croatia', code: '+385' },
  { name: 'Cuba', code: '+53' },
  { name: 'Curacao', code: '+599' },
  { name: 'Cyprus', code: '+357' },
  { name: 'Czech Republic', code: '+420' },
  { name: 'Democratic Republic of the Congo', code: '+243' },
  { name: 'Denmark', code: '+45' },
  { name: 'Djibouti', code: '+253' },
  { name: 'Dominica', code: '+1-767' },
  { name: 'Dominican Republic', code: '+1-809' },
  { name: 'Dominican Republic', code: '+1-829' },
  { name: 'Dominican Republic', code: '+1-849' },
  { name: 'East Timor', code: '+670' },
  { name: 'Ecuador', code: '+593' },
  { name: 'Egypt', code: '+20' },
  { name: 'El Salvador', code: '+503' },
  { name: 'Equatorial Guinea', code: '+240' },
  { name: 'Eritrea', code: '+291' },
  { name: 'Estonia', code: '+372' },
  { name: 'Ethiopia', code: '+251' },
  { name: 'Falkland Islands', code: '+500' },
  { name: 'Faroe Islands', code: '+298' },
  { name: 'Fiji', code: '+679' },
  { name: 'Finland', code: '+358' },
  { name: 'France', code: '+33' },
  { name: 'French Polynesia', code: '+689' },
  { name: 'Gabon', code: '+241' },
  { name: 'Gambia', code: '+220' },
  { name: 'Georgia', code: '+995' },
  { name: 'Germany', code: '+49' },
  { name: 'Ghana', code: '+233' },
  { name: 'Gibraltar', code: '+350' },
  { name: 'Greece', code: '+30' },
  { name: 'Greenland', code: '+299' },
  { name: 'Grenada', code: '+1-473' },
  { name: 'Guam', code: '+1-671' },
  { name: 'Guatemala', code: '+502' },
  { name: 'Guernsey', code: '+44-1481' },
  { name: 'Guinea', code: '+224' },
  { name: 'Guinea-Bissau', code: '+245' },
  { name: 'Guyana', code: '+592' },
  { name: 'Haiti', code: '+509' },
  { name: 'Honduras', code: '+504' },
  { name: 'Hong Kong', code: '+852' },
  { name: 'Hungary', code: '+36' },
  { name: 'Iceland', code: '+354' },
  { name: 'India', code: '+91' },
  { name: 'Indonesia', code: '+62' },
  { name: 'Iran', code: '+98' },
  { name: 'Iraq', code: '+964' },
  { name: 'Ireland', code: '+353' },
  { name: 'Isle of Man', code: '+44-1624' },
  { name: 'Israel', code: '+972' },
  { name: 'Italy', code: '+39' },
  { name: 'Ivory Coast', code: '+225' },
  { name: 'Jamaica', code: '+1-876' },
  { name: 'Japan', code: '+81' },
  { name: 'Jersey', code: '+44-1534' },
  { name: 'Jordan', code: '+962' },
  { name: 'Kazakhstan', code: '+7' },
  { name: 'Kenya', code: '+254' },
  { name: 'Kiribati', code: '+686' },
  { name: 'Kosovo', code: '+383' },
  { name: 'Kuwait', code: '+965' },
  { name: 'Kyrgyzstan', code: '+996' },
  { name: 'Laos', code: '+856' },
  { name: 'Latvia', code: '+371' },
  { name: 'Lebanon', code: '+961' },
  { name: 'Lesotho', code: '+266' },
  { name: 'Liberia', code: '+231' },
  { name: 'Libya', code: '+218' },
  { name: 'Liechtenstein', code: '+423' },
  { name: 'Lithuania', code: '+370' },
  { name: 'Luxembourg', code: '+352' },
  { name: 'Macau', code: '+853' },
  { name: 'Macedonia', code: '+389' },
  { name: 'Madagascar', code: '+261' },
  { name: 'Malawi', code: '+265' },
  { name: 'Malaysia', code: '+60' },
  { name: 'Maldives', code: '+960' },
  { name: 'Mali', code: '+223' },
  { name: 'Malta', code: '+356' },
  { name: 'Marshall Islands', code: '+692' },
  { name: 'Mauritania', code: '+222' },
  { name: 'Mauritius', code: '+230' },
  { name: 'Mayotte', code: '+262' },
  { name: 'Mexico', code: '+52' },
  { name: 'Micronesia', code: '+691' },
  { name: 'Moldova', code: '+373' },
  { name: 'Monaco', code: '+377' },
  { name: 'Mongolia', code: '+976' },
  { name: 'Montenegro', code: '+382' },
  { name: 'Montserrat', code: '+1-664' },
  { name: 'Morocco', code: '+212' },
  { name: 'Mozambique', code: '+258' },
  { name: 'Myanmar', code: '+95' },
  { name: 'Namibia', code: '+264' },
  { name: 'Nauru', code: '+674' },
  { name: 'Nepal', code: '+977' },
  { name: 'Netherlands', code: '+31' },
  { name: 'Netherlands Antilles', code: '+599' },
  { name: 'New Caledonia', code: '+687' },
  { name: 'New Zealand', code: '+64' },
  { name: 'Nicaragua', code: '+505' },
  { name: 'Niger', code: '+227' },
  { name: 'Nigeria', code: '+234' },
  { name: 'Niue', code: '+683' },
  { name: 'North Korea', code: '+850' },
  { name: 'Northern Mariana Islands', code: '+1-670' },
  { name: 'Norway', code: '+47' },
  { name: 'Oman', code: '+968' },
  { name: 'Pakistan', code: '+92' },
  { name: 'Palau', code: '+680' },
  { name: 'Palestine', code: '+970' },
  { name: 'Panama', code: '+507' },
  { name: 'Papua New Guinea', code: '+675' },
  { name: 'Paraguay', code: '+595' },
  { name: 'Peru', code: '+51' },
  { name: 'Philippines', code: '+63' },
  { name: 'Pitcairn', code: '+64' },
  { name: 'Poland', code: '+48' },
  { name: 'Portugal', code: '+351' },
  { name: 'Puerto Rico', code: '+1-787' },
  { name: 'Puerto Rico', code: '+1-939' },
  { name: 'Qatar', code: '+974' },
  { name: 'Republic of the Congo', code: '+242' },
  { name: 'Reunion', code: '+262' },
  { name: 'Romania', code: '+40' },
  { name: 'Russia', code: '+7' },
  { name: 'Rwanda', code: '+250' },
  { name: 'Saint Barthelemy', code: '+590' },
  { name: 'Saint Helena', code: '+290' },
  { name: 'Saint Kitts and Nevis', code: '+1-869' },
  { name: 'Saint Lucia', code: '+1-758' },
  { name: 'Saint Martin', code: '+590' },
  { name: 'Saint Pierre and Miquelon', code: '+508' },
  { name: 'Saint Vincent and the Grenadines', code: '+1-784' },
  { name: 'Samoa', code: '+685' },
  { name: 'San Marino', code: '+37' },
  { name: 'Sao Tome and Principe', code: '+239' },
  { name: 'Saudi Arabia', code: '+966' },
  { name: 'Senegal', code: '+221' },
  { name: 'Serbia', code: '+381' },
  { name: 'Seychelles', code: '+248' },
  { name: 'Sierra Leone', code: '+232' },
  { name: 'Singapore', code: '+65' },
  { name: 'Sint Maarten', code: '+1-721' },
  { name: 'Slovakia', code: '+421' },
  { name: 'Slovenia', code: '+386' },
  { name: 'Solomon Islands', code: '+677' },
  { name: 'Somalia', code: '+252' },
  { name: 'South Africa', code: '+27' },
  { name: 'South Korea', code: '+82' },
  { name: 'South Sudan', code: '+211' },
  { name: 'Spain', code: '+34' },
  { name: 'Sri Lanka', code: '+94' },
  { name: 'Sudan', code: '+249' },
  { name: 'Suriname', code: '+597' },
  { name: 'Svalbard and Jan Mayen', code: '+47' },
  { name: 'Swaziland', code: '+268' },
  { name: 'Sweden', code: '+46' },
  { name: 'Switzerland', code: '+41' },
  { name: 'Syria', code: '+963' },
  { name: 'Taiwan', code: '+886' },
  { name: 'Tajikistan', code: '+992' },
  { name: 'Tanzania', code: '+255' },
  { name: 'Thailand', code: '+66' },
  { name: 'Togo', code: '+228' },
  { name: 'Tokelau', code: '+690' },
  { name: 'Tonga', code: '+676' },
  { name: 'Trinidad and Tobago', code: '+1-868' },
  { name: 'Tunisia', code: '+216' },
  { name: 'Turkey', code: '+90' },
  { name: 'Turkmenistan', code: '+993' },
  { name: 'Turks and Caicos Islands', code: '+1-649' },
  { name: 'Tuvalu', code: '+688' },
  { name: 'U.S. Virgin Islands', code: '+1-340' },
  { name: 'Uganda', code: '+256' },
  { name: 'Ukraine', code: '+380' },
  { name: 'United Arab Emirates', code: '+971' },
  { name: 'United Kingdom', code: '+44' },
  { name: 'United States', code: '+1' },
  { name: 'Uruguay', code: '+598' },
  { name: 'Uzbekistan', code: '+998' },
  { name: 'Vanuatu', code: '+678' },
  { name: 'Vatican', code: '+379' },
  { name: 'Venezuela', code: '+58' },
  { name: 'Vietnam', code: '+84' },
  { name: 'Wallis and Futuna', code: '+681' },
  { name: 'Western Sahara', code: '+212' },
  { name: 'Yemen', code: '+967' },
  { name: 'Zambia', code: '+260' },
  { name: 'Zimbabwe', code: '+263' }

])

const phone = reactive({
    code: "",
    number: "",
})

const form = reactive({
    id: 0,
    user_id: 0,
    company_id: 0,
    contact_gender: "",
    first_name: "",
    last_name: "",
    title: "",
    phone_number: "",
    email: "",
    edited_by: "",

})


onMounted(async () => {
  try {
    const resContacts = await axios.get(`${BASE_URL}/contacts`)
    contacts.value = resContacts.data.contacts

    const resCompanies = await axios.get(`${BASE_URL}/companies`)
    companies.value = resCompanies.data.companies

    if (route.query.search) {
        search.value = route.query.search
    }
  } catch (err) {
    console.error('Error fetching users:', err)
  }

})

const fetchContacts = async () => {
    try {
        const resContacts = await axios.get(`${BASE_URL}/contacts`)
        contacts.value = resContacts.data.contacts

        const resCompanies = await axios.get(`${BASE_URL}/companies`)
        companies.value = resCompanies.data.companies
    } catch (err) {
        console.error('Error fetching users:', err)
    }
};

const openCreateModal = async () => {
    form.id = 0;
    form.user_id = 0;
    form.company_id = 0;
    form.contact_gender = "";
    form.first_name = "";
    form.last_name = "";
    form.title = "";
    form.phone_number = "";
    form.email = "";
    form.edited_by = "";
    phone.code = "";
    phone.number = "";

    submitClass.value = "";
    editClass.value = "hidden";
    createClass.value = "";

}

const closeCreateModal = () => {
    createClass.value = "hidden";
}

const splitPhoneNumber = (phoneNumber) => {
    const text = phoneNumber;
    const separator = ' ';

    const firstSpaceIndex = text.indexOf(separator);

    if (firstSpaceIndex === -1) {
        phone.code = "";
        phone.number = phoneNumber;
    } else {
        phone.code = text.slice(0, firstSpaceIndex);
        phone.number = text.slice(firstSpaceIndex + 1);
    }
}

const submitContact = async () => {
    try {
        form.phone_number = phone.code + " " + phone.number
        
        const url = `${BASE_URL}/contacts`;
        const res = await axios.post(url, form);

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';

        form.id = 0;
        form.user_id = 0;
        form.company_id = 0;
        form.contact_gender = "";
        form.first_name = "";
        form.last_name = "";
        form.title = "";
        form.phone_number = "";
        form.email = "";
        form.edited_by = "";
        phone.code = "";
        phone.number = "";

        closeCreateModal()
        await fetchContacts();

    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }
}



const openEditModal = async (contactID) => {
    try {
        const url = `${BASE_URL}/contacts/${contactID}`;
        const res = await axios.get(url);

        form.id = res.data.id;
        form.user_id = res.data.user_id;
        form.company_id = res.data.company_id;
        form.contact_gender = res.data.contact_gender;
        form.first_name = res.data.first_name;
        form.last_name = res.data.last_name;
        form.title = res.data.title;
        form.phone_number = res.data.phone_number;
        form.email = res.data.email;
        form.edited_by = res.data.edited_by;

        splitPhoneNumber(res.data.phone_number);
        openEditModalId.value = true;

        submitClass.value = "hidden";
        editClass.value = "";
        createClass.value = "";

    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }
}



const editContact = async (contactID) => {
    try {
        form.phone_number = phone.code + " " + phone.number
        
        const url = `${BASE_URL}/contacts/${contactID}`;
        const res = await axios.put(url, form);

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';

        form.id = 0;
        form.user_id = 0;
        form.company_id = 0;
        form.contact_gender = "";
        form.first_name = "";
        form.last_name = "";
        form.title = "";
        form.phone_number = "";
        form.email = "";
        form.edited_by = "";
        phone.code = "";
        phone.number = "";

        closeCreateModal()
        await fetchContacts();

    } catch (error) {
        const errorMessage = error.response?.data?.error || 'An unexpected error occurred.';
        message.value = errorMessage;
        messageClass.value = 'bg-red-100 text-red-700';
    }
}

const deleteContact = async (contactID) => {
    message.value = '';

    try {
        const url = `${BASE_URL}/contacts/${contactID}`;
        const res = await axios.delete(url);

        message.value = res.data.message;
        messageClass.value = 'bg-green-100 text-green-700';
    } catch (error) {
        
        const errorMessage = error.response?.data?.error || 'Failed to delete event.';
        message.value = `Error: ${errorMessage}`;
        messageClass.value = 'bg-red-100 text-red-700';
        console.error('Delete error:', error);
    }

    closeDeleteModal()
    await fetchContacts();
}

const openDeleteModal = (id) => {
    openDeleteModalId.value = id;
    deletedContactId.value = null;
}

const closeDeleteModal = () => {
    openDeleteModalId.value = null;
}

const filteredContacts = computed(() => {
  const keyword = search.value.toLowerCase()

  return contacts.value
    .map(contact => ({
      ...contact,
      full_name: `${contact.first_name} ${contact.last_name}`
    }))
    .filter(contact => {
      if (!keyword) return true

      return (
        contact.first_name.toLowerCase().includes(keyword) ||
        contact.last_name.toLowerCase().includes(keyword) ||
        contact.full_name.toLowerCase().includes(keyword)
      )
    })
})

/*
const filteredContacts = computed(() => {
    if (!search.value) return contacts.value

    const keyword = search.value.toLowerCase()

    return contacts.value.filter(contact =>
        contact.first_name.toLowerCase().includes(keyword) ||
        contact.last_name.toLowerCase().includes(keyword)
    )
})

const newContacts = computed(() =>
    contacts.value.map(contact => ({
        ...contact,
        full_name: `${contact.first_name} ${contact.last_name}`
    }))
)
*/

watch(search, (val) => {
  router.replace({
    query: val ? { search: val } : {}
  })
})
/*
watch(
  () => route.query.search,
  (val) => {
    search.value = val || ''
  }
)
*/

function formatDate(dateStr) {
  return dayjs(dateStr).format('D MMMM YYYY')
}

</script>
