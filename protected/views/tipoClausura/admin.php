<?php
/* @var $this TipoClausuraController */
/* @var $model TipoClausura */



$this->menu=array(
	array('label'=>'Listar TipoClausura', 'url'=>array('index')),
	array('label'=>'Crear TipoClausura', 'url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$('#tipo-clausura-grid').yiiGridView('update', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Buscar Tipo Clausuras</h1>

<p>
Puedes Colocar Operadores de comparación (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) 
</p>

<?php echo CHtml::link('Busqueda Avanzada','#',array('class'=>'search-button')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('zii.widgets.grid.CGridView', array(
	'id'=>'tipo-clausura-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id',
		'nombre_tipo_clausura',
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
