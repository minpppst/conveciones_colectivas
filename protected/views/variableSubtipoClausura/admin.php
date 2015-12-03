<?php
/* @var $this VariableSubtipoClausuraController */
/* @var $model VariableSubtipoClausura */



$this->menu=array(
	array('label'=>'Listar VariableSubtipoClausura', 'url'=>array('index')),
	array('label'=>'Crear VariableSubtipoClausura', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#variable-subtipo-clausura-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Variables Subtipo Clausuras</h1>

<p>
Puedes Colocar Operadores de comparación. (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>).
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'variable-subtipo-clausura-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
                array(
                 'name'=>'id_subtipo',
                 'value'=>'$data->idSubtipo->nombre_sub_tipo_clausura',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 //'filter'=>  Empresa::getListrama(),    //Esto ya es un agregado, muestra un combobox con todas las categorias para poder filtrarlas, si no lo ponemos usa el id_categoria por defecto
                 //Debemos de crear una función estática en el modelo Categorias que se llame getListCategorias(), esto es totalmente opcional
                 ),
		array(
                 'name'=>'tipo_campo',
                 'value'=>'$data->tiposcampos->tipo',  //Con esto se mostrará la descripción de la categoría en vez del id_categoria
                 
                 ),
		
		'nombre_variable',
		'tamanio',
		'nomenclatura',
		array(
			'class'=>'CButtonColumn',
                        'template'=>'{view}{update}{delete}',
            
                    'buttons' => array(
                     'delete' => array(
                         'label'=>'Borrar',
                        'visible' => '!Yii::app()->user->isGuest && Yii::app()->user->isSuperAdmin',
                     ),),
                    
                    
                    
		),
	),
)); ?>
