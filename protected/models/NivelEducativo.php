<?php

/**
 * This is the model class for table "nivel_educativo".
 *
 * The followings are the available columns in table 'nivel_educativo':
 * @property string $id
 * @property string $cod_interno
 * @property string $descripcion_nivel
 *
 * The followings are the available model relations:
 * @property Nomina[] $nominas
 */
class NivelEducativo extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return NivelEducativo the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'nivel_educativo';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('cod_interno, descripcion_nivel', 'required'),
			array('cod_interno', 'length', 'max'=>2),
			array('descripcion_nivel', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, cod_interno, descripcion_nivel', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'nominas' => array(self::HAS_MANY, 'Nomina', 'nivel_educativo'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'cod_interno' => 'Cod Interno',
			'descripcion_nivel' => 'Descripcion Nivel',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id,true);
		$criteria->compare('cod_interno',$this->cod_interno,true);
		$criteria->compare('descripcion_nivel',$this->descripcion_nivel,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}