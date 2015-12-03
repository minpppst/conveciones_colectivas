<?php
/* @var $this ClausurasController */
/* @var $model Clausuras */

$this->menu=array(
	array('label'=>'Listar Clausuras', 'url'=>array('index')),
	
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#clausuras-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Clausuras</h1>

<p>
Puedes Colocar Operadores de comparación.  (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) 
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'clausuras-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'cod_convencion',
                array(
                 'name'=>'cod_convencion',
                 'value'=>'$data->codConvencion->nombre',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 'filter'=> Clausuras::getListconvencion_clau(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
		'nro_clausura',
		'tipo_clausura',
                 array(
                 'name'=>'tipo_clausura',
                 'value'=>'$data->tipoClausura->nombre_tipo_clausura',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 'filter'=> Clausuras::getListtipo_clau(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
		'sub_tipo',
                array(
                 'name'=>'sub_tipo',
                 'value'=>'$data->subTipo->nombre_sub_tipo_clausura',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 'filter'=> Clausuras::getListsubtipo_clau(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
		//'id_variable',
		
		'valor',
		
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
