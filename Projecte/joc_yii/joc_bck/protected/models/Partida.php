<?php

/**
 * This is the model class for table "partida".
 *
 * The followings are the available columns in table 'partida':
 * @property integer $id
 * @property string $data
 * @property integer $enemics
 * @property integer $winner_id
 * @property integer $loser_id
 * @property integer $temps
 */
class Partida extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'partida';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('data, enemics, winner_id, loser_id, temps', 'required'),
			array('enemics, winner_id, loser_id, temps', 'numerical', 'integerOnly'=>true),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, data, enemics, winner_id, loser_id, temps', 'safe', 'on'=>'search'),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'data' => 'Data',
			'enemics' => 'Enemics',
			'winner_id' => 'Winner',
			'loser_id' => 'Loser',
			'temps' => 'Temps',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('data',$this->data,true);
		$criteria->compare('enemics',$this->enemics);
		$criteria->compare('winner_id',$this->winner_id);
		$criteria->compare('loser_id',$this->loser_id);
		$criteria->compare('temps',$this->temps);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Partida the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
