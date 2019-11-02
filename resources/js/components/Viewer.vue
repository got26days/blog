<template>
    <div>
        <form style="margin-top: 40px;">

            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <label for="validationCustom01">Дата начала</label>
                    <input type="date" class="form-control" placeholder="Первое имя" value="Mark" v-model="firstdate">
                </div>

                <div class="col-md-4 mb-3">
                    <label for="validationCustom01">Дата Окончания</label>
                    <input type="date" class="form-control" placeholder="Второе имя" value="Mark" v-model="seconddate">
                </div>
				<div class="col-md-4 mb-3">
                    <label>Сортировка</label>
                    <select class="custom-select" v-model="sort">
                        <option value="1">По убыванию</option>
                        <option value="2" selected>По возрастанию</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-4 mb-3">
                    <label>На главную</label>
                    <select class="custom-select" v-model="area2">
                        <option selected value="">Все</option>
                        <option value="1">Да</option>
                        <option value="0">Нет</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label>Тема</label>
                    <select class="custom-select" v-model="position">
                        <option selected value="">Все</option>
                        <option value="1">Политика</option>
                        <option value="2">Шоу Бизнес</option>
                        <option value="5">Происшествия</option>
                    </select>
                </div>
                <div class="col-md-4 mb-3">
                    <label>Ссылка</label>
                    <select class="custom-select" v-model="link">
                        <option selected value="">Все</option>
                        <option value="0">На новость</option>
                        <option value="1">На страницу</option>
                    </select>
                </div>
            </div>
            <div style="margin-bottom: 40px; margin-top: 10px;">
                <button class="btn btn-primary" @click.stop.prevent="getData()">Поиск</button>
            </div>

        </form>

        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th :class="{ 'activv': sortkey == 'id' }" scope="col">id <i class="fas fa-sort" @click="sortkey = 'id'"></i></th>
                    <th :class="{ 'activv': sortkey == 'title' }" scope="col" class="titlecol">Наименование <i class="fas fa-sort" @click="sortkey = 'title'"></i>
                    </th>
                    <th :class="{ 'activv': sortkey == 'area2' }" scope="col">На главную <i class="fas fa-sort" @click="sortkey = 'area2'"></i></th>
                    <th :class="{ 'activv': sortkey == 'link' }" scope="col">Ссылка <i class="fas fa-sort" @click="sortkey = 'link'"></i></th>
                    <th :class="{ 'activv': sortkey == 'position' }" scope="col">Тема <i class="fas fa-sort" @click="sortkey = 'position'"></i></th>
                    <th :class="{ 'activv': sortkey == 'market' }" scope="col">Показать <i class="fas fa-sort" @click="sortkey = 'market'"></i></th>
                    <th :class="{ 'activv': sortkey == 'super_view' }" scope="col">Показы <i class="fas fa-sort" @click="sortkey = 'super_view'"></i></th>
                    <th :class="{ 'activv': sortkey == 'super_click' }" scope="col">Клики <i class="fas fa-sort" @click="sortkey = 'super_click'"></i></th>
                    <th :class="{ 'activv': sortkey == 'ctr' }" scope="col">CTR (%) <i class="fas fa-sort" @click="sortkey = 'ctr'"></i></th>

                </tr>
            </thead>
            <tbody>
                <tr v-for="data in datas">
                    <th scope="row">{{ data.id }}</th>
                    <td><a :href="'/post' + data.id">{{ data.title }}</a></td>
                    <td>{{ data.area2 | inpage }}</td>
                    <td>{{ data.link | inlink }}</td>
                    <td>{{ data.position | inposition }}</td>
                    <td>{{ data.market }}</td>
                    <td>{{ data.super_view }}</td>
                    <td>{{ data.super_click }}</td>
                    <td>{{ data.ctr }} </td>
                </tr>
            </tbody>
        </table>


    </div>
</template>

<script>
    export default {
        data() {
            return {
                datas: [],
                firstdate: '',
                seconddate: '',
                sortkey: '',
				area2: '',
				position: '',
				link: '',
				sort: 2,
            }
        },
        watch: {
            sortkey: function () {
                this.getData();
            },
        },
        methods: {
            getData() {
                axios.get(
                    	`/admin/viewer/getdata?firstdate=${this.firstdate}&seconddate=${this.seconddate}&sortkey=${this.sortkey}&area2=${this.area2}&position=${this.position}&link=${this.link}$sort=${this.sort}`
                    )
                    .then(response => {
                        this.datas = response.data;
                    });
            }
        },
        filters: {
            inpage: function (value) {
                if (value == '0') {
                    return "Нет"
                } else {
                    return "Да"
                }
            },
            inposition: function (value) {
                if (value == '0') {
                    return "Финансы"
                }
                if (value == '1') {
                    return "Политика"
                }
                if (value == '2') {
                    return "Шоу бизнес"
                }
                if (value == '3') {
                    return "Здовроье"
                }
                if (value == '4') {
                    return "Астрология"
                }
            },
            inlink: function (value) {
                if (value == '0') {
                    return 'На новость'
                }
                if (value == '1') {
                    return 'На страницу 1'
                }
                if (value == '2') {
                    return 'На страницу 2'
                }
                if (value == '3') {
                    return 'На страницу 3'
                }
                if (value == '4') {
                    return 'На страницу 4'
                }
                if (value == '5') {
                    return 'На страницу 5'
                }
                if (value == '6') {
                    return 'На страницу 6'
                }
                if (value == '7') {
                    return 'На страницу 7'
                }
                if (value == '8') {
                    return 'На страницу 8'
                }
                if (value == '9') {
                    return 'На страницу 9'
                }
                if (value == '10') {
                    return 'На страницу 10'
                }
                if (value == '11') {
                    return 'На страницу 11'
                }
                if (value == '12') {
                    return 'На страницу 12'
                }

            }
        },
        mounted() {
            console.log('Component mounted.')
            this.getData();
        },
    }

</script>

<style scoped>
    .fa-sort {
        cursor: pointer;
    }

    .table {
        font-size: 12px;
    }

    .titlecol {
        width: 250px;
    }

	.activv{
		color: red !important;
	}

</style>
