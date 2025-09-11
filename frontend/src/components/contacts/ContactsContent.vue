<template>
    <div class="py-1">
        <div class="mx-auto sm:px-6 lg:px-8">
            <div name="header" class="mt-2 p-2">
                <h1 class="font-bold text-xl text-gray-800">
                    CONTACTS
                </h1>
                <hr>
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
                        <input type="search"
                            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5  dark:bg-white dark:border-gray-600 dark:placeholder-black dark:text-black dark:focus:ring-blue-500 dark:focus:border-blue-500"
                            placeholder="Search" name="search" value="">
                    </div>
                    <button type="submit"
                        class="p-2.5 ml-2 text-sm font-medium text-white bg-gray-700 rounded-lg border border-gray-700 hover:bg-gray-800 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-600 dark:hover:bg-gray-700 dark:focus:ring-gray-800">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                            xmlns="http://www.w3.org/2000/svg">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"></path>
                        </svg>
                        <span class="sr-only">Search</span>
                    </button>
                </form>
                <div class="flex flex-row-reverse">
                    <router-link to="/contacts/create-contact">
                        <button
                        class="inline items-center px-4 py-2 my-3 bg-black border border-transparent rounded-md font-semibold text-xs text-white uppercase tracking-widest hover:bg-gray-700 active:bg-gray-900 focus:outline-none focus:border-gray-900 focus:shadow-outline-gray disabled:opacity-25 transition ease-in-out duration-150">
                        Create New Contact
                        </button>
                    </router-link>
                </div>
            </div>
            <!-- Sesuaikan jumlah kolom beserta gap jika ingin merubah jumlah data yang ditampilkan-->
            <div class="grid grid-cols-4 gap-2">
                    <article class="w-full max-w-sm px-4 py-3 rounded-md shadow-md bg-white border border-gray-600">
                        <div>
                            <div class="flex flex-row-reverse mt-2">
                                <span
                                    class="text-sm font-light text-gray-800 dark:text-gray-800"> Creator name || Created date</span>
                            </div>
                            <div>
                                <h1 class="mt-2 text-lg font-semibold text-gray-800 dark:text-black">
                                    Contact full name
                                </h1>
                                <p class="font-normal text-sm text-gray-700 dark:text-black"><font-awesome-icon icon="building" />
                                    Company name </p>
                                <p class="font-normal text-sm text-gray-700 dark:text-black"><font-awesome-icon icon="thumbtack" />
                                    Contact title </p>
                                <p class="font-normal text-sm text-gray-700 dark:text-black"><font-awesome-icon icon="phone" />
                                    Phone number </p>
                                <p class="font-normal text-sm text-gray-700 dark:text-black"><font-awesome-icon icon="envelope" />
                                    Email </p>
                            </div>
                            <div class="flex flex-row-reverse">
                                <button wire:click=""
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="trash" />
                                </button>
                                <button wire:click=""
                                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                    <font-awesome-icon icon="edit" />
                                </button>
                                <a href="">
                                    <button
                                        class="inline-flex items-center px-3 py-2 text-sm font-medium text-center text-black bg-gray-0 rounded-lg hover:bg-gray-400 focus:ring-4 focus:outline-none focus:ring-gray-300 dark:bg-gray-0 dark:hover:bg-gray-400 dark:focus:ring-gray-300 ease-in-out duration-150">
                                        <font-awesome-icon icon="magnifying-glass" />
                                    </button>
                                </a>
                            </div>
                        </div>
                    </article>
                    
            </div>
        </div>
    </div>
</template>
