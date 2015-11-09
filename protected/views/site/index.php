<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>

<h1>Bienvenido a <i><?php echo CHtml::encode(Yii::app()->name); ?></i></h1>

<p>Buscar Convenciones Colectivas.</p>

<form method="get">
Nombre o RIF: <input type="search" placeholder="Buscar" name="q" 

value="<?=isset($_GET['q']) ? CHtml::encode($_GET['q']) : '' ; 

?>" />
<input type="submit" value="search" />
</form>

<?php if(!empty($mensaje)){
    echo $mensaje;
}else{
    


 $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'../convencion/_view_relacional',
        'emptyText' => 'No Se Han Encontrado Resultados, <a href=index.php?r=convencion/create>¿Desea Crear Una Convencion Nueva?</a>'
));

}?>

