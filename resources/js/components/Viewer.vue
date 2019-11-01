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
			</div>
			<div style="padding-bottom: 40px;">
				<button class="btn btn-primary" @click.stop.prevent="getData()">Поиск</button>
			</div>
			 
		</form>

        <table class="table">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">id</th>
					<th scope="col">Наименование</th>
                    <th scope="col">На главную</th>
                    <th scope="col">Ссылка</th>
                    <th scope="col">Тема</th>
					<th scope="col">Показать</th>
					<th scope="col">Показы</th>
					<th scope="col">Клики</th>
					<th scope="col">CTR (%) <i class="fas fa-sort" @click="sortkey = 'ctr'"></i></th>
					<th scope="col">Показы</th>
					<th scope="col">Клики</th>
					<th scope="col">CTR (%)</th>
					
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
					<td>{{ data.view }}</td>
					<td>{{ data.click }}</td>
					<td>{{ data.result }} </td>
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
            }
        },
        methods: {
            getData() {
                axios.get(`/admin/viewer/getdata?firstdate=${this.firstdate}&seconddate=${this.seconddate}&sortkey=${this.sortkey}`)
                    .then(response => {
                        this.datas = response.data;
                    });
            }
		},
		filters: {
			inpage: function (value){
				if(value == '0') {
					return "Нет"
				} else {
					return "Да"
				}
			},
			inposition: function (value){
				if(value == '0') {
					return "Финансы"
				}
				if(value == '1') {
					return "Политика"
				}
				if(value == '2') {
					return "Шоу бизнес"
				}
				if(value == '3') {
					return "Здовроье"
				}
				if(value == '4') {
					return "Астрология"
				}
			},
			inlink: function(value){
				if(value == '0'){
					return 'На новость'
				}
				if(value == '1'){
					return 'На страницу 1'
				}
				if(value == '2'){
					return 'На страницу 2'
				}
				if(value == '3'){
					return 'На страницу 3'
				}
				if(value == '4'){
					return 'На страницу 4'
				}
				if(value == '5'){
					return 'На страницу 5'
				}
				if(value == '6'){
					return 'На страницу 6'
				}
				if(value == '7'){
					return 'На страницу 7'
				}
				if(value == '8'){
					return 'На страницу 8'
				}
				if(value == '9'){
					return 'На страницу 9'
				}
				if(value == '10'){
					return 'На страницу 10'
				}
				if(value == '11'){
					return 'На страницу 11'
				}
				if(value == '12'){
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
