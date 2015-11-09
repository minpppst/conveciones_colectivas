<?php
/* @var $this ConvencionController */
/* @var $model Convencion */



$this->menu=array(
	array('label'=>'Listar Convencion', 'url'=>array('index')),
       
	//array('label'=>'Create Convencion', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#convencion-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Convencions</h1>

<p>
Puedes colocar comparadores opcionales (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>).
</p>

<?php echo CHtml::link('Busqueda Avazanda','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'convencion-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		//'id',
		'nombre',
		'numero_expediente',
		array(
                 'name'=>'inspectoria',
                 'value'=>'$data->inspectoria0->inspectoria',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 'filter'=>  Convencion::getListInspectoria(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
                 array(
                 'name'=>'sector',
                 'value'=>'$data->sector0->nombre',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 'filter'=>  Convencion::getListSector(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
		//'sector',
		array(
                 'name'=>'ambito',
                 'value'=>'$data->ambito0->nombre_ambito',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 'filter'=>Convencion::getListAmbito(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
		/*
		'edicion',
		'fecha_deposito',
		'fecha_inicio',
		'fecha_venc',
		'duracion_meses',
		'fecha_auto_homo',
		'costo_contrato',
		'costo_contrato_sin_prestaciones',
		'cod_convencion',
		'referencia',
		*/
		array(
			'class'=>'CButtonColumn',
		),
	),
)); ?>
